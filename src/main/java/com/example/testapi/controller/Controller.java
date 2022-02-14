package com.example.testapi.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class Controller {

    @GetMapping("/get")
    public String get (@RequestHeader String name){
        return name;
    }

    @PostMapping("/post")
    public User post(@RequestBody User user){
        return user;
    }

}
