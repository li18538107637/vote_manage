package com.cnstock.votemgt.service;

import com.cnstock.votemgt.dao.VoteUserDao;
import com.cnstock.votemgt.dto.VoteUserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class VoteUserService {
    @Autowired
    private VoteUserDao voteUserDao;

    public String getUserNameByUserId(){
        HashMap<String,String> voteUserMap = voteUserDao.getVoteUserByUserId("123");

        return voteUserMap.get("roleName");
    }
}
