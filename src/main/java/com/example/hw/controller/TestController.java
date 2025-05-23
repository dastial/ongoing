package com.example.hw.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
public class TestController{

    @GetMapping("/get")
    public String getMapping(){
        return "Hello World From Me";
    }
}