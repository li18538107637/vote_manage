package com.cnstock.votemgt.dao;

import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public interface VoteUserDao {

    HashMap<String,String> getVoteUserByUserId(String userName);
}
