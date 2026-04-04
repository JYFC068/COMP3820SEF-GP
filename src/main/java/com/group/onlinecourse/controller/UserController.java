package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.repository.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserRepository userRepository;

    // Constructor injection matching your VoteController style
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Displays the profile update page
    @GetMapping("/profile")
    public String showProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByUsername(auth.getName());
        model.addAttribute("user", user);
        return "profile"; // Refers to WEB-INF/views/profile.jsp
    }

    // Processes the update request
    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute("user") User updatedData) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User existingUser = userRepository.findByUsername(auth.getName());

        if (existingUser != null) {
            // Update only allowed fields as per requirements
            existingUser.setFullName(updatedData.getFullName());
            existingUser.setEmail(updatedData.getEmail());
            existingUser.setPhone(updatedData.getPhone());

            // Password update is optional but common;
            // ensure you encode it if your system uses password encoding
            if (updatedData.getPassword() != null && !updatedData.getPassword().isEmpty()) {
                existingUser.setPassword(updatedData.getPassword());
            }

            userRepository.save(existingUser);
        }

        return "redirect:/profile?success";
    }
}
