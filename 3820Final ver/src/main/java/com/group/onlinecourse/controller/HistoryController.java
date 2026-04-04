package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.entity.Vote;
import com.group.onlinecourse.repository.CommentRepository;
import com.group.onlinecourse.repository.UserRepository;
import com.group.onlinecourse.repository.VoteRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HistoryController {
    private final VoteRepository voteRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;

    public HistoryController(VoteRepository voteRepository,
                             CommentRepository commentRepository,
                             UserRepository userRepository) {
        this.voteRepository = voteRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/voteHistory")
    public String voteHistory(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);

        List<Vote> votes = voteRepository.findByUser(user);
        model.addAttribute("votes", votes);
        return "voteHistory";
    }

    @GetMapping("/commentHistory")
    public String commentHistory(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);

        List<Comment> comments = commentRepository.findByUser(user);
        model.addAttribute("comments", comments);
        return "commentHistory";
    }
}
