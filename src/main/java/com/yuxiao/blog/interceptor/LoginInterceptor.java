package com.yuxiao.blog.interceptor;

import com.yuxiao.blog.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/login");
        return false;
    }
}
