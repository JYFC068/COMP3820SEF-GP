package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.repository.UserRepository;
import com.group.onlinecourse.repository.LectureRepository;
import com.group.onlinecourse.repository.PollRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserRepository userRepository;
    private final LectureRepository lectureRepository;
    private final PollRepository pollRepository;

    public AdminController(UserRepository userRepository,
                           LectureRepository lectureRepository,
                           PollRepository pollRepository) {
        this.userRepository = userRepository;
        this.lectureRepository = lectureRepository;
        this.pollRepository = pollRepository;
    }

    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "adminUsers";
    }

    @PostMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
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
                             @RequestParam String filePath) {
        Lecture lecture = new Lecture();
        lecture.setTitle(title);
        lecture.setSummary(summary);
        lecture.setFilePath(filePath);
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
    public String addPoll(@RequestParam String question) {
        Poll poll = new Poll();
        poll.setQuestion(question);
        pollRepository.save(poll);
        return "redirect:/admin/polls";
    }

    @PostMapping("/polls/delete/{id}")
    public String deletePoll(@PathVariable Long id) {
        pollRepository.deleteById(id);
        return "redirect:/admin/polls";
    }
}
