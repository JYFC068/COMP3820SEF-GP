package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.PollOption;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.entity.Vote;
import com.group.onlinecourse.repository.PollOptionRepository;
import com.group.onlinecourse.repository.UserRepository;
import com.group.onlinecourse.repository.VoteRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class VoteController {
    private final VoteRepository voteRepository;
    private final PollOptionRepository pollOptionRepository;
    private final UserRepository userRepository;

    public VoteController(VoteRepository voteRepository,
                          PollOptionRepository pollOptionRepository,
                          UserRepository userRepository) {
        this.voteRepository = voteRepository;
        this.pollOptionRepository = pollOptionRepository;
        this.userRepository = userRepository;
    }

    @PostMapping("/vote")
    public String submitVote(@RequestParam Long optionId) {
        PollOption option = pollOptionRepository.findById(optionId).orElse(null);
        if (option != null) {
            option.setVoteCount(option.getVoteCount() + 1);
            pollOptionRepository.save(option);

            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String username = auth.getName();
            User user = userRepository.findByUsername(username);

            Vote vote = new Vote();
            vote.setPoll(option.getPoll());
            vote.setOption(option);
            vote.setUser(user);
            voteRepository.save(vote);
        }
        return "redirect:/";
    }
}
