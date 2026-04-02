package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String fullName,
                           @RequestParam String email,
                           @RequestParam String phone,
                           @RequestParam String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole(role.toUpperCase());
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);

        userRepository.save(user);
        return "redirect:/login";
    }
}
