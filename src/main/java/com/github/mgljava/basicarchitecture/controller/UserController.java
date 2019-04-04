package com.github.mgljava.basicarchitecture.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @GetMapping("/say")
    public String sayHello() {
        return "Hello World!";
    }
}
