package com.yuxiao.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * Created by ${邹} on 2018/11/2.
 * 描述：
 */
@Controller
public class MainController extends BaseController {
    @GetMapping("/document/{page}")
    public String document(@PathVariable String page){
        return "/document/" + page;
    }

    @GetMapping("/test/{page}")
    public String test(@PathVariable String page){
        return "/test/" + page;
    }

    @GetMapping("/{page}")
    public String main(@PathVariable String page){
        return page;
    }

    @GetMapping("/admin/{page}")
    public String admin(@PathVariable String page){
        return "/admin/" + page;
    }

    @GetMapping("/comm/{page}")
    public String comm(@PathVariable String page){
        return "/comm/" + page;
    }

    @GetMapping("/user/{page}")
    public String user(@PathVariable String page){
        return "/user/" + page;
    }

    @GetMapping("/shirotest/{page}")
    public String shirotest(@PathVariable String page){
        return "/shirotest/" + page;
    }
}
