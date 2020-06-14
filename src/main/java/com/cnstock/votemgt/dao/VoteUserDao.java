package com.cnstock.votemgt.dao;

import com.cnstock.votemgt.dto.VoteUserDto;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface VoteUserDao {

    HashMap<String,String> getVoteUserByUserId(String userName);

    List<HashMap<String,String>> getVoteUseList(HashMap<String,Object> params);

    Integer getVoteUseListCount(HashMap<String,Object> params);
}
