package com.cnstock.votemgt.dao;

import com.cnstock.votemgt.dto.VoteOptionDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VoteOptionDao {

    int addOptionConfig(List<VoteOptionDto> optionList);
}
