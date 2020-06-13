package com.cnstock.votemgt.dao;

import com.cnstock.votemgt.dto.VoteQuestionDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VoteQuestionDao {

    int addQuestionConfig(List<VoteQuestionDto> questionList);
    List<VoteQuestionDto> getQuestionByVoteId(String voteId);
    VoteQuestionDto getQuestionByQuestionId(String questionId);
}
