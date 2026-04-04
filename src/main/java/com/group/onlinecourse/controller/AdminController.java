package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.PollOption;
import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.repository.UserRepository;
import com.group.onlinecourse.repository.LectureRepository;
import com.group.onlinecourse.repository.PollRepository;
import com.group.onlinecourse.repository.PollOptionRepository;
import com.group.onlinecourse.repository.CommentRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserRepository userRepository;
    private final LectureRepository lectureRepository;
    private final PollRepository pollRepository;
    private final PollOptionRepository pollOptionRepository;
    private final CommentRepository commentRepository;
    private final PasswordEncoder passwordEncoder;

    public AdminController(UserRepository userRepository,
                           LectureRepository lectureRepository,
                           PollRepository pollRepository,
                           PollOptionRepository pollOptionRepository,
                           CommentRepository commentRepository,
                           PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.lectureRepository = lectureRepository;
        this.pollRepository = pollRepository;
        this.pollOptionRepository = pollOptionRepository;
        this.commentRepository = commentRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "adminUsers";
    }

    @PostMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }

    @PostMapping("/update")
    public String updateUser(@RequestParam(required = false) Long id,
                             @RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String fullName,
                             @RequestParam String email,
                             @RequestParam String role) {
        User user;
        if (id != null) {
            user = userRepository.findById(id).orElse(new User());
        } else {
            user = new User();
        }
        user.setUsername(username);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setRole(role);

        if (password != null && !password.trim().isEmpty()) {
            user.setPassword(passwordEncoder.encode(password));
        }

        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/lectures")
    public String listLectures(Model model) {
        List<Lecture> lectures = lectureRepository.findAll();
        model.addAttribute("lectures", lectures);
        return "adminLectures";
    }

    @PostMapping("/lectures/add")
    public String addLecture(@RequestParam String title,
                             @RequestParam String summary,
                             @RequestParam(value = "file", required = false) MultipartFile file) {

        Lecture lecture = new Lecture();
        lecture.setTitle(title);
        lecture.setSummary(summary);

        if (file != null && !file.isEmpty()) {
            try {
                lecture.setFileName(file.getOriginalFilename());
                lecture.setFileContent(file.getBytes());
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            lecture.setFileName(null);
            lecture.setFileContent(null);
        }

        lectureRepository.save(lecture);
        return "redirect:/admin/lectures";
    }

    @PostMapping("/lectures/delete/{id}")
    public String deleteLecture(@PathVariable Long id) {
        lectureRepository.deleteById(id);
        return "redirect:/admin/lectures";
    }

    @GetMapping("/polls")
    public String listPolls(Model model) {
        List<Poll> polls = pollRepository.findAll();
        model.addAttribute("polls", polls);
        return "adminPolls";
    }

    @PostMapping("/polls/add")
    public String addPoll(@RequestParam String question,
                          @RequestParam("options") String[] options) {
        Poll poll = new Poll();
        poll.setQuestion(question);
        Poll savedPoll = pollRepository.save(poll);

        if (options != null) {
            for (String optionText : options) {
                if (optionText != null && !optionText.trim().isEmpty()) {
                    PollOption option = new PollOption();
                    option.setOptionText(optionText.trim());
                    option.setVoteCount(0);
                    option.setPoll(savedPoll);
                    pollOptionRepository.save(option);
                }
            }
        }
        return "redirect:/admin/polls";
    }

    @PostMapping("/polls/delete/{id}")
    public String deletePoll(@PathVariable Long id) {
        pollRepository.deleteById(id);
        return "redirect:/admin/polls";
    }

    @PostMapping("/comments/delete/{id}")
    public String deleteComment(@PathVariable Long id, @RequestParam String redirectPath) {
        commentRepository.deleteById(id);
        return "redirect:" + redirectPath;
    }
}
