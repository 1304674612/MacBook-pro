package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HelloController {
    
    @GetMapping("/hello")
    public String hello() {
        return "Hello from Spring Boot! 你好，Spring Boot!";
    }
    
    @GetMapping("/info")
    public AppInfo getInfo() {
        return new AppInfo("Demo Application", "1.0.0", "Spring Boot 示例应用");
    }
    
    // 内部类作为响应对象
    static class AppInfo {
        private String name;
        private String version;
        private String description;
        
        public AppInfo(String name, String version, String description) {
            this.name = name;
            this.version = version;
            this.description = description;
        }
        
        // Getters
        public String getName() { return name; }
        public String getVersion() { return version; }
        public String getDescription() { return description; }
    }
}
