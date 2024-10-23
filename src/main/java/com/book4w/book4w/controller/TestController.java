package com.book4w.book4w.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class TestController {

    @GetMapping("/test")
    public void test() {
        System.out.println("hello test!");
    }

    @GetMapping("/test2")
    public void test2() {
        System.out.println("hello test2!");
    }


}
