package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.PollOption;
import com.group.onlinecourse.repository.LectureRepository;
import com.group.onlinecourse.repository.PollRepository;
import com.group.onlinecourse.repository.PollOptionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    private final LectureRepository lectureRepository;
    private final PollRepository pollRepository;
    private final PollOptionRepository pollOptionRepository;

    public HomeController(LectureRepository lectureRepository,
                          PollRepository pollRepository,
                          PollOptionRepository pollOptionRepository) {
        this.lectureRepository = lectureRepository;
        this.pollRepository = pollRepository;
        this.pollOptionRepository = pollOptionRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Lecture> lectures = lectureRepository.findAll();
        List<Poll> polls = pollRepository.findAll();

        model.addAttribute("lectures", lectures);
        model.addAttribute("polls", polls);
        model.addAttribute("pollOptions", pollOptionRepository.findAll());
        return "index";
    }
}