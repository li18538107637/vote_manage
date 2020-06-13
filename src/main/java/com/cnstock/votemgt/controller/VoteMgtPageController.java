package com.cnstock.votemgt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/voteMgtPage")
public class VoteMgtPageController {

    @RequestMapping("/userPage")
    public String toUserPage(){
        return "userPage";
    }

    @RequestMapping("/votePage")
    public String toVoteManage(String voteId, Model model){
        model.addAttribute("voteId",voteId);
        return "votePage";
    }

    @RequestMapping("/countPage")
    public String toCountPage(){
        return "countPage";
    }

    @RequestMapping("/logPage")
    public String toLogPage(){
        return "logPage";
    }

    @RequestMapping("/showVotePage")
    public String showVotePage(){
        return "showVotePage";
    }


}
