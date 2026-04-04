package com.group.onlinecourse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OnlineCourseApplication {

    public static void main(String[] args) {
        SpringApplication.run(OnlineCourseApplication.class, args);
        System.out.println("=================================================");
        System.out.println("✅ Online Course Website 啟動成功！");
        System.out.println("🌐 請在瀏覽器輸入：http://localhost:8080");
        System.out.println("=================================================");
    }
}