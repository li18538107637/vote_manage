package com.cnstock.votemgt.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()// 该方法所返回的对象的方法来配置请求级别的安全细节
                .antMatchers("/login").permitAll() // 登录页面不拦截
                .antMatchers("/voteMgtConfig/**").permitAll() // 调用api不需要拦截
                .antMatchers("/voteMgtPage/**").hasRole("user")
                .antMatchers("/voteMgtPage/**").hasRole("admin")
                .antMatchers("/voteMgtPage/userPage").hasRole("admin")
                .antMatchers(HttpMethod.POST, "/checkLogin").permitAll().anyRequest().authenticated()// 对于登录路径不进行拦截
                .and().formLogin()// 配置登录页面
                .loginPage("/login")// 登录页面的访问路径;
                .loginProcessingUrl("/checkLogin")// 登录页面下表单提交的路径
                .failureUrl("/login?paramserror=true")// 登录失败后跳转的路径,为了给客户端提示
                .successForwardUrl("/index")// 登录成功后默认跳转的路径;
                .and().logout()// 用户退出操作
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))// 用户退出所访问的路径，需要使用Post方式
                .permitAll().logoutSuccessUrl("/login?logout=true")/// 退出成功所访问的路径
                .and().exceptionHandling().accessDeniedPage("/403")
                .and()
                .csrf().disable()
                .headers().frameOptions()// 允许iframe内呈现。
                .sameOrigin()
                .and().sessionManagement();
    }

    @Override
    public void configure(WebSecurity web) {
        web
                .ignoring()
                .antMatchers("/css/**","/images/**","/js/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
