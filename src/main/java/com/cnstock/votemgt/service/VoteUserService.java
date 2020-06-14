package com.cnstock.votemgt.service;

import com.cnstock.votemgt.dao.VoteUserDao;
import com.cnstock.votemgt.dto.VoteUserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class VoteUserService {
    @Autowired
    private VoteUserDao voteUserDao;

    public  HashMap<String,Object> getUserList(Integer pageSize , Integer pageNum ){
        HashMap<String,Object> resultMap = new HashMap();

        HashMap<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("fromIndex",(pageNum-1)*pageSize);
        paramsMap.put("pageSize",pageSize);
        List<HashMap<String,String>> userList = voteUserDao.getVoteUseList(paramsMap);

        int totalCount = voteUserDao.getVoteUseListCount(paramsMap);

        int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : (totalCount / pageSize) + 1;
        resultMap.put("userList",userList);
        resultMap.put("totalPage",totalPage);
        resultMap.put("totalCount",totalCount);

        return resultMap;
    }
}
