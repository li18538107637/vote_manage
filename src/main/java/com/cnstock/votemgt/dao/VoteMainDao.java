package com.cnstock.votemgt.dao;

import com.cnstock.votemgt.dto.VoteMainDto;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface VoteMainDao {

    int addVoteConfig(VoteMainDto voteMainDto);

    List<VoteMainDto> getVoteList(HashMap<String,Object> params);
    VoteMainDto getVoteByVoteId(String voteId);
    int getVoteListCount(HashMap<String,Object> params);
}
