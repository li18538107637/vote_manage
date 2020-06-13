package com.cnstock.votemgt.service;

import com.cnstock.votemgt.dao.VoteUserDao;
import com.cnstock.votemgt.dto.VoteUserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Component
public class VoteUserDetailService implements UserDetailsService {
    @Autowired
    private VoteUserDao voteUserDao;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        HashMap<String,String> voteUserMap = voteUserDao.getVoteUserByUserId(username);
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_"+voteUserMap.get("roleName")));
        if (voteUserMap == null){
            return null;
        }
        return new User(voteUserMap.get("username"),voteUserMap.get("password"),true,
                true,
                true,
                true,
                authorities);
    }
}
