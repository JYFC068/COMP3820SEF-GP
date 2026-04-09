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
    public String showAllVoteHistory(Model model) {
        List<Vote> allVotes = voteRepository.findAll();

        model.addAttribute("votes", allVotes);
        return "voteHistory";
    }

    @GetMapping("/commentHistory")
    public String showAllCommentHistory(Model model) {
        List<Comment> allComments = commentRepository.findAll();

        model.addAttribute("comments", allComments);
        return "commentHistory";
    }
}