package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.*;
import com.group.onlinecourse.repository.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

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
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByUsername(auth.getName());

        PollOption selectedOption = pollOptionRepository.findById(optionId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid option"));
        Poll poll = selectedOption.getPoll();

        Optional<Vote> existingVote = voteRepository.findByPollAndUser(poll, user);

        if (existingVote.isPresent()) {
            PollOption oldOption = existingVote.get().getPollOption();
            oldOption.setVoteCount(Math.max(0, oldOption.getVoteCount() - 1));
            pollOptionRepository.save(oldOption);

            Vote vote = existingVote.get();
            vote.setPollOption(selectedOption);
            voteRepository.save(vote);
        } else {
            Vote newVote = new Vote();
            newVote.setPoll(poll);
            newVote.setUser(user);
            newVote.setPollOption(selectedOption);
            voteRepository.save(newVote);
        }

        selectedOption.setVoteCount(selectedOption.getVoteCount() + 1);
        pollOptionRepository.save(selectedOption);

        return "redirect:/poll/" + poll.getId();
    }
}