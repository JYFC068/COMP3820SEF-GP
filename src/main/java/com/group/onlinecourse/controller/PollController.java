package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.repository.CommentRepository;
import com.group.onlinecourse.repository.PollRepository;
import com.group.onlinecourse.repository.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PollController {
    private final PollRepository pollRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;

    public PollController(PollRepository pollRepository,
                          CommentRepository commentRepository,
                          UserRepository userRepository) {
        this.pollRepository = pollRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/poll/{id}")
    public String pollPage(@PathVariable Long id, Model model) {
        Poll poll = pollRepository.findById(id).orElse(null);
        List<Comment> comments = commentRepository.findAll();
        model.addAttribute("poll", poll);
        model.addAttribute("comments", comments);
        return "poll";
    }

    @PostMapping("/poll/{id}/comment")
    public String addComment(@PathVariable Long id, @RequestParam String content) {
        Poll poll = pollRepository.findById(id).orElse(null);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);

        Comment comment = new Comment();
        comment.setPoll(poll);
        comment.setUser(user);
        comment.setContent(content);
        commentRepository.save(comment);

        return "redirect:/poll/" + id;
    }
}
