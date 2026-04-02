package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.repository.CommentRepository;
import com.group.onlinecourse.repository.LectureRepository;
import com.group.onlinecourse.repository.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class LectureController {
    private final LectureRepository lectureRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;

    public LectureController(LectureRepository lectureRepository,
                             CommentRepository commentRepository,
                             UserRepository userRepository) {
        this.lectureRepository = lectureRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/lecture/{id}")
    public String lecturePage(@PathVariable Long id, Model model) {
        Lecture lecture = lectureRepository.findById(id).orElse(null);
        List<Comment> comments = commentRepository.findAll();
        model.addAttribute("lecture", lecture);
        model.addAttribute("comments", comments);
        return "lecture";
    }

    @PostMapping("/lecture/{id}/comment")
    public String addComment(@PathVariable Long id, @RequestParam String content) {
        Lecture lecture = lectureRepository.findById(id).orElse(null);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);

        Comment comment = new Comment();
        comment.setLecture(lecture);
        comment.setUser(user);
        comment.setContent(content);
        commentRepository.save(comment);

        return "redirect:/lecture/" + id;
    }
}
