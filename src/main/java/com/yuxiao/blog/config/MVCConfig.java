package com.yuxiao.blog.config;

import com.yuxiao.blog.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class MVCConfig implements WebMvcConfigurer {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        List<String> excludePatterns = new ArrayList<String>();
        excludePatterns.add("/css/**");
        excludePatterns.add("/images/**");
        excludePatterns.add("/register");
        excludePatterns.add( "/js/**" );
        excludePatterns.add("/login");
        excludePatterns.add("/api/user/login");
        excludePatterns.add("/api/user/reg");
        excludePatterns.add( "/api/verify/getcode" );
        excludePatterns.add( "/shirotest/**" );
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(excludePatterns);

    }
}
