package com.hello.springmvcdemo;

// import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {

    @RequestMapping("/")
    public String home() {
        return "hello spring home";
    }

    @RequestMapping("/hello")
    public String show() {
        return "hello world";
    }

    @RequestMapping("/new")
    public String showNew() {
        return "this is  new  world";
    }
}
