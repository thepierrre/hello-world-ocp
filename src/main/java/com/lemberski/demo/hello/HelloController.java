package com.lemberski.demo.hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${name:World}")
    private String name;

    @GetMapping
    public String sayHello() {
        return "Hello " + name + "!";
    }

}
