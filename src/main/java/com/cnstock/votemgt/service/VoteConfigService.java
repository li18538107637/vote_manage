package com.cnstock.votemgt.service;

import com.cnstock.votemgt.dao.VoteMainDao;
import com.cnstock.votemgt.dao.VoteOptionDao;
import com.cnstock.votemgt.dao.VoteQuestionDao;
import com.cnstock.votemgt.dto.VoteMainDto;
import com.cnstock.votemgt.dto.VoteOptionDto;
import com.cnstock.votemgt.dto.VoteQuestionDto;
import com.cnstock.votemgt.utils.RedisUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

@Service
public class VoteConfigService {
    @Autowired
    private VoteMainDao voteMainDao;
    @Autowired
    private VoteOptionDao voteOptionDao;
    @Autowired
    private VoteQuestionDao voteQuestionDao;

    Log log = LogFactory.getLog(VoteConfigService.class);

    /**
     * 添加投票配置到数据库中
     * @param voteParams
     * @param voteId
     * @return
     */
    @Transactional
    public HashMap<String ,Object> addVoteConfig(HashMap<String,Object> voteParams,String voteId){
        String voteTitle = (String) voteParams.get("voteTitle");
        String isShowCount = (String) voteParams.get("isShowCount");
        String voteStartTime = (String) voteParams.get("voteStartTime");
        String voteEndTime = (String) voteParams.get("voteEndTime");


        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //插入投票配置到主配置表
        VoteMainDto voteMainDto = new VoteMainDto();
        voteMainDto.setEndTime(voteEndTime);
        voteMainDto.setVoteId(voteId);
        voteMainDto.setStartTime(voteStartTime);
        voteMainDto.setTitle(voteTitle);
        voteMainDto.setIsValid(1);
        voteMainDto.setNeedCount(Integer.valueOf(isShowCount));
        voteMainDto.setCreateBy(username);
        voteMainDto.setUpdateBy(username);
        voteMainDto.setType(1);
        voteMainDao.addVoteConfig(voteMainDto);


        //插入投票问题配置表
        List<String> questionList = (List<String>) voteParams.get("questionList");

        List<VoteQuestionDto> voteQuestionDtoList = new ArrayList<>();
        List<VoteOptionDto> voteOptionDtoList = new ArrayList<>();
        for (int i = 0; i < questionList.size(); i++) {
            VoteQuestionDto voteQuestionDto = new VoteQuestionDto();
            String questionId =  questionList.get(i);
            Map<Object, Object> questionConfigMap = RedisUtil.hmget("vote:question:" + questionId);
            voteQuestionDto.setQuestionId(questionId);
            voteQuestionDto.setQuestionTitle((String) questionConfigMap.get("question_title"));
            voteQuestionDto.setVoteId(voteId);
            voteQuestionDto.setQuestionType(Integer.valueOf((String) questionConfigMap.get("question_type")));
            voteQuestionDto.setUpdateBy(username);
            voteQuestionDto.setCreateBy(username);

            voteQuestionDtoList.add(voteQuestionDto);
            List<String> optionIdList= (List<String>) questionConfigMap.get("optionList");
            for (int j = 0; j < optionIdList.size(); j++) {
                String optionId =  optionIdList.get(j);
                Map<Object, Object> optionConfigMap = RedisUtil.hmget("vote:option:" + optionId);
                VoteOptionDto voteOptionDto = new VoteOptionDto();
                voteOptionDto.setImgUrl((String) optionConfigMap.get("option_img_url"));
                voteOptionDto.setOptionId(optionId);
                voteOptionDto.setOptionTitle((String) optionConfigMap.get("option_content"));
                voteOptionDto.setQuestionId(questionId);
                voteOptionDto.setUpdateBy(username);
                voteOptionDto.setCreateBy(username);
                voteOptionDto.setSelectCount(0);
                voteOptionDtoList.add(voteOptionDto);
            }
        }
        voteOptionDao.addOptionConfig(voteOptionDtoList);
        voteQuestionDao.addQuestionConfig(voteQuestionDtoList);

        return null;
    }

    /**
     * 分页从数据库中查询投票信息列表
     * @param pageSize
     * @param pageNum
     * @return
     */
    public HashMap<String,Object> getVoteList(Integer pageSize,Integer pageNum){
        HashMap<String,Object> resultMap = new HashMap();

        HashMap<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("fromIndex",(pageNum-1)*pageSize);
        paramsMap.put("pageSize",pageSize);
        List<VoteMainDto> voteList = voteMainDao.getVoteList(paramsMap);

        int totalCount = voteMainDao.getVoteListCount(paramsMap);

        int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : (totalCount / pageSize) + 1;
        resultMap.put("voteList",voteList);
        resultMap.put("totalPage",totalPage);
        resultMap.put("totalCount",totalCount);

        return resultMap;

    }


    /**
     * 解析上传的csv文件
     * @param file
     * @return
     */
    public HashMap<String,Object> readCsv(MultipartFile file){
        HashMap<String,Object> result = new HashMap<>();
        List<HashMap<String,String>> resultList = new ArrayList<>();

        List<List<String>> strs = new ArrayList<>();
        if (!file.isEmpty()){
            InputStreamReader isr = null;
            BufferedReader br = null;
            try {
                //读取文件输入流
                isr = new InputStreamReader(file.getInputStream());
                br = new BufferedReader(isr);
                String line;
                while ((line = br.readLine()) != null){
                    //以逗号分割，解析文件中的投票配置内容，放入list中
                    strs.add(Arrays.asList(line.split(",")));
                }
                //获取list中的问题名称和问题类型，放入hashmap中去重
                HashMap<String,String> questionMap = new HashMap<>();
                for (int i = 1; i < strs.size(); i++) {
                    List<String> strings =  strs.get(i);
                    questionMap.put(strings.get(0),strings.get(2));
                }

                //遍历每个问题选项，通过问题名称进行对应，并存入redis中
                HashMap<String,Object> voteQuestionMap = new HashMap<>();

                for (String questionTitle : questionMap.keySet()){
                    HashMap<String,String> resultMap = new HashMap<>();
                    List<String> optionIdList = new ArrayList<>();
                    for (int i = 1; i < strs.size(); i++) {
                        List<String> strings =  strs.get(i);
                        if (questionTitle.equals(strings.get(0))){
                            //保存问题选项到redis中
                            HashMap<String,Object> optionMap = new HashMap<>();
                            String optionId = UUID.randomUUID().toString();
                            optionMap.put("option_content",strings.get(1));
                            RedisUtil.hmset("vote:option:" + optionId, optionMap);
                            optionIdList.add(optionId);
                        }
                    }
                    voteQuestionMap.put("question_type",questionMap.get(questionTitle));
                    voteQuestionMap.put("question_title",questionTitle);
                    voteQuestionMap.put("optionList",optionIdList);
                    String questionId = UUID.randomUUID().toString();
                    RedisUtil.hmset("vote:question:" + questionId, voteQuestionMap);
                    resultMap.put("question_id", questionId);
                    resultMap.put("question_title", questionTitle);
                    resultList.add(resultMap);
                }
                result.put("questionList",resultList);
                result.put("returnCode", "0");
                result.put("returnMsg", "success");
            } catch (IOException e) {
                result.put("returnCode", "1");
                result.put("returnMsg", "上传图片问题失败");
                log.error("上传图片问题失败");
            }finally {
                try {
                    if (br != null){
                        br.close();
                    }
                    if (isr != null){
                        isr.close();
                    }
                } catch (IOException e) {
                    //
                }
            }
        }
        return result;
    }

    /**
     * 将数据库中保存的数据取出，同步存储到redis缓存中
     * @param voteId
     * @return
     */
    public HashMap<String,Object> getVoteConfig(String voteId){
        HashMap<String,Object> voteConfigMap = new HashMap<>();
        VoteMainDto voteMainDto = voteMainDao.getVoteByVoteId(voteId);
        List<VoteQuestionDto> questionList = voteQuestionDao.getQuestionByVoteId(voteId);
        List<String> questionIdList = new ArrayList<>();
        for (int i = 0; i < questionList.size(); i++) {
            VoteQuestionDto voteQuestionDto =  questionList.get(i);
            questionIdList.add(voteQuestionDto.getQuestionId());
        }
        voteConfigMap.put("voteTitle",voteMainDto.getTitle());
        voteConfigMap.put("isShowCount",voteMainDto.getNeedCount());
        voteConfigMap.put("voteStartTime",voteMainDto.getStartTime());
        voteConfigMap.put("voteEndTime",voteMainDto.getEndTime());
        voteConfigMap.put("questionList",questionList);
        return voteConfigMap;
    }


    //获取投票内容
    public HashMap<String,Object> getVoteContent(String voteId){
        HashMap<String,Object> voteConfigMap = new HashMap<>();
        VoteMainDto voteMainDto = voteMainDao.getVoteByVoteId(voteId);
        voteConfigMap.put("voteId",voteMainDto.getVoteId());
        voteConfigMap.put("title",voteMainDto.getTitle());
        voteConfigMap.put("startTime",voteMainDto.getStartTime());
        voteConfigMap.put("endTime",voteMainDto.getEndTime());
        voteConfigMap.put("needCount",voteMainDto.getNeedCount());
        List<VoteQuestionDto> questionList = voteQuestionDao.getQuestionByVoteId(voteId);
        voteConfigMap.put("questionList",questionList);
        return voteConfigMap;
    }



}
