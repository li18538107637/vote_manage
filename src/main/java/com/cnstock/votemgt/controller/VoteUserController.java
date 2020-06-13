package com.cnstock.votemgt.controller;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

@Controller
public class VoteUserController {

    @RequestMapping("/")
    public String index(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(String paramserror){
        String msg = paramserror;
        return "login";
    }

    @RequestMapping("/index")
    public String toIndex(Model model) {
        //从springSecurity上下文中获取用户名
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("name",name);
        //从springSecurity上下文中获取用户角色
        Collection<? extends GrantedAuthority> authoritys = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        String viewName = "index";
//        List<HashMap<String,String>> menuList = new ArrayList<>();
//        HashMap<String,String> menuMap1 = new HashMap<>();
//        menuMap1.put("menuName","投票管理");
//        menuMap1.put("menuUrl","/voteMgtPage/votePage");
//        HashMap<String,String> menuMap2 = new HashMap<>();
//        menuMap2.put("menuName","用户管理");
//        menuMap2.put("menuUrl","/voteMgtPage/userPage");
//        HashMap<String,String> menuMap3 = new HashMap<>();
//        menuMap3.put("menuName","投票统计");
//        menuMap3.put("menuUrl","/voteMgtPage/countPage");
//        HashMap<String,String> menuMap4 = new HashMap<>();
//        menuMap4.put("menuName","日志管理");
//        menuMap4.put("menuUrl","/voteMgtPage/logPage");

//        for (GrantedAuthority grantedAuthority : authoritys) {
//            if ("ROLE_admin".equals(grantedAuthority.getAuthority())) {
//                menuList.add(menuMap1);
//                menuList.add(menuMap2);
//                menuList.add(menuMap3);
//                menuList.add(menuMap4);
//                model.addAttribute("menuList",menuList);
//            } else if ("ROLE_user".equals(grantedAuthority.getAuthority())) {
//                menuList.add(menuMap1);
//                menuList.add(menuMap3);
//                menuList.add(menuMap4);
//                model.addAttribute("menuList",menuList);
//            }
//        }
        return viewName;
    }
}
