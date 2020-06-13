package com.cnstock.votemgt.controller;

import com.cnstock.votemgt.constant.Constants;
import com.cnstock.votemgt.service.VoteConfigService;
import com.cnstock.votemgt.utils.RedisUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/voteMgtConfig")
public class VoteConfigController {

    @Autowired
    public VoteConfigService voteConfigService;

    Log log = LogFactory.getLog(VoteConfigController.class);

    @RequestMapping(value = "/addQuestionConfig", method = RequestMethod.POST)
    @ResponseBody
    public String addQuestionConfig(HttpServletRequest httpServletRequest) {
        HashMap<String, Object> voteQuestionMap = new HashMap<>();
        //获取question_id，如果不为空，则删除redis中已存在的数据
        String old_question_id = httpServletRequest.getParameter("question_id");
        if (!StringUtils.isEmpty(old_question_id)) {
            RedisUtil.del("vote:question:" + old_question_id);
        }
        //获取提交的问题配置信息
        String question_title = httpServletRequest.getParameter("question_title");
        String question_type = httpServletRequest.getParameter("question_type");
        String optionsArray = httpServletRequest.getParameter("optionsArray");
        voteQuestionMap.put("question_title", question_title);
        voteQuestionMap.put("question_type", question_type);
        //获取图片信息
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) httpServletRequest;
        String questionId = UUID.randomUUID().toString();
        Gson gson = new Gson();
        HashMap<String, String> resultMap = new HashMap<>();
        try {
            List<HashMap<String, Object>> optionList = gson.fromJson(optionsArray, new TypeToken<List<HashMap<String, String>>>() {
            }.getType());
            List<String> optionIdList = new ArrayList<>();
            for (int i = 0; i < optionList.size(); i++) {
                HashMap<String, Object> optionHashMap = optionList.get(i);
                String voteOptionId = (String) optionHashMap.get("option_id");
                MultipartFile mFile = mRequest.getFile(voteOptionId);
                if (mFile == null) {
                    //如果图片内容为空，判断option_img_url的属性
                    String optionImgUrl = (String) optionHashMap.get("option_img_url");
                    if (!StringUtils.isEmpty(optionImgUrl)) {
                        optionHashMap.put("img", optionImgUrl);
                    }
                } else {
                    String originalFileName = mFile.getOriginalFilename();
                    String newFileName = questionId + voteOptionId + originalFileName.substring(originalFileName.lastIndexOf("."));
                    String filename = System.getProperty("user.dir") + "/voteimg/" + newFileName;
                    File file = new File(filename);
                    if (!file.getParentFile().exists()) {
                        file.getParentFile().mkdirs();
                    }
                    mFile.transferTo(file);
                    optionHashMap.put("option_img_url", filename);
                }

                String optionId = UUID.randomUUID().toString();
                RedisUtil.hmset("vote:option:" + optionId, optionHashMap);
                optionIdList.add(optionId);
            }


            voteQuestionMap.put("optionList", optionIdList);
            RedisUtil.hmset("vote:question:" + questionId, voteQuestionMap);

            resultMap.put("question_id", questionId);
            resultMap.put("question_title", question_title);

            resultMap.put("returnCode", "0");
            resultMap.put("returnMsg", "success");
        } catch (Exception e) {
            resultMap.put("returnCode", "1");
            resultMap.put("returnMsg", "添加问题配置失败");
            log.error("添加问题配置失败");
        }

        return new Gson().toJson(resultMap);
    }

    /**
     * 删除投票配置
     * @param questionId
     * @return
     */
    @RequestMapping(value = "/delQuestionConfig", method = RequestMethod.POST)
    @ResponseBody
    public String delQuestionConfig(String questionId) {

        HashMap<String, String> resultMap = new HashMap<>();
        try {
            RedisUtil.del("vote:question:" + questionId);
            resultMap.put("returnCode", "0");
            resultMap.put("returnMsg", "success");
        } catch (Exception e) {
            resultMap.put("returnCode", "1");
            resultMap.put("returnMsg", "删除问题配置失败");
            log.error("删除问题配置失败");
        }
        return new Gson().toJson(resultMap);
    }

    /**
     * 通过投票问题id获取投票信息
     * @param questionId
     * @return
     */
    @RequestMapping(value = "/getQuestionConfig", method = RequestMethod.GET)
    @ResponseBody
    public String getQuestionConfig(String questionId) {

        HashMap<String, Object> resultMap = new HashMap<>();
        try {
            Map<Object, Object> questionConfigMap = RedisUtil.hmget("vote:question:" + questionId);
            List<Map<Object, Object>> optionList = new ArrayList<>();
            List<String> optionIdList = (List<String>) questionConfigMap.get("optionList");
            for (int i = 0; i < optionIdList.size(); i++) {
                String optionId = optionIdList.get(i);
                Map<Object, Object> optionMap = RedisUtil.hmget("vote:option:" + optionId);
                optionList.add(optionMap);
            }
            questionConfigMap.put("optionList", optionList);
            resultMap.put("questionConfigMap", questionConfigMap);
            resultMap.put("returnCode", "0");
            resultMap.put("returnMsg", "success");
        } catch (Exception e) {
            resultMap.put("returnCode", "1");
            resultMap.put("returnMsg", "修改问题配置失败");
            log.error("修改问题配置失败");
        }
        return new Gson().toJson(resultMap);
    }


    @RequestMapping(value = "/saveVoteConfig", method = RequestMethod.POST)
    @ResponseBody
    public String saveVoteConfig(@RequestBody HashMap<String, Object> voteParams) {
        String voteId = UUID.randomUUID().toString();
        HashMap<String, String> resultMap = new HashMap<>();
        try {
            //保存投票信息到数据库中
            voteConfigService.addVoteConfig(voteParams, voteId);
            //保存投票配置到redis中
            HashMap<String,Object> voteConfig = voteConfigService.getVoteConfig(voteId);
            RedisUtil.hmset("vote:" + voteId, voteConfig);

            resultMap.put("returnCode", "0");
            resultMap.put("returnMsg", "success");

        } catch (Exception e) {
            resultMap.put("returnCode", "1");
            resultMap.put("returnMsg", "保存投票配置失败");
            log.error("保存投票配置失败");
        }
        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/getVoteList", method = RequestMethod.GET)
    @ResponseBody
    public String getVoteList(Integer pageSize, Integer pageNum) {
        HashMap<String, Object> resultMap = new HashMap();

        try {
            if (StringUtils.isEmpty(pageSize)) {
                pageSize = Constants.DEFALUT_PAGE_SIZE;
            }

            if (StringUtils.isEmpty(pageNum)) {
                pageNum = Constants.DEFALUT_PAGE_NUM;
            }
            resultMap = voteConfigService.getVoteList(pageSize, pageNum);


            resultMap.put("returnCode", "0");
            resultMap.put("returnMsg", "success");
        } catch (Exception e) {
            log.error("query black list have a exception the message is:" + e.getMessage(), e);
            resultMap.put("returnCode", "1");
            resultMap.put("returnMsg", "获取投票列表失败");
        }
        return new Gson().toJson(resultMap);
    }

    /**
     * 从上传的csv文件中获取投票配置信息
     * @param file
     * @return
     */
    @RequestMapping(value = "/parsingCsv", method = RequestMethod.POST)
    @ResponseBody
    public String parsingCsv(MultipartFile file) {
        HashMap<String,Object> resultMap = null;
        try {
             resultMap = voteConfigService.readCsv(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Gson().toJson(resultMap);
    }

    /**
     * 根据voteId，获取投票信息,返回到页面，用于投票配置的修改
     * @param voteId
     * @return
     */
    @RequestMapping(value = "/getVoteConfig", method = RequestMethod.GET)
    @ResponseBody
    public String parsingCsv(String voteId) {
        HashMap<String, Object> resultMap = new HashMap();

        try{
            resultMap = voteConfigService.getVoteContent(voteId);
            resultMap.put("returnCode", "0");
            resultMap.put("returnMsg", "success");
        }catch (Exception e){
            resultMap.put("returnCode", "1");
            resultMap.put("returnMsg", "获取投票信息失败");
            log.error("获取投票信息失败");
        }

        return new Gson().toJson(resultMap);
    }
}
