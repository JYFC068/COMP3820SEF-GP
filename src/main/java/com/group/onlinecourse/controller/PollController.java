package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.entity.PollOption;
import com.group.onlinecourse.entity.Vote;
import com.group.onlinecourse.repository.PollOptionRepository;
import com.group.onlinecourse.repository.VoteRepository;
import com.group.onlinecourse.repository.CommentRepository;
import com.group.onlinecourse.repository.PollRepository;
import com.group.onlinecourse.repository.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

import java.util.List;

@Controller
public class PollController {
    private final PollRepository pollRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;
    private final PollOptionRepository pollOptionRepository;
    private final VoteRepository voteRepository;

    public PollController(PollRepository pollRepository,
                          CommentRepository commentRepository,
                          UserRepository userRepository,
                          PollOptionRepository pollOptionRepository,
                          VoteRepository voteRepository) {
        this.pollRepository = pollRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
        this.pollOptionRepository = pollOptionRepository;
        this.voteRepository = voteRepository;
    }

    @GetMapping("/poll/{id}")
    public String pollPage(@PathVariable Long id, Model model) {
        Poll poll = pollRepository.findById(id).orElse(null);
        if (poll == null) return "redirect:/";

        List<Comment> comments = commentRepository.findByPoll(poll);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);

        if (user != null) {
            Optional<Vote> currentVote = voteRepository.findByPollAndUser(poll, user);
            model.addAttribute("userCurrentVote", currentVote.orElse(null));
        }

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

    @PostMapping("/poll/{id}/vote")
    public String handleVote(@PathVariable Long id, @RequestParam Long optionId) {
        Poll poll = pollRepository.findById(id).orElse(null);
        PollOption selectedOption = pollOptionRepository.findById(optionId).orElse(null);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByUsername(auth.getName());

        Optional<Vote> existingVote = voteRepository.findByPollAndUser(poll, user);

        if (existingVote.isPresent()) {
            PollOption oldOption = existingVote.get().getPollOption();

            if (!oldOption.getId().equals(optionId)) {
                oldOption.setVoteCount(oldOption.getVoteCount() - 1);
                selectedOption.setVoteCount(selectedOption.getVoteCount() + 1);

                existingVote.get().setPollOption(selectedOption);

                pollOptionRepository.save(oldOption);
                pollOptionRepository.save(selectedOption);
                voteRepository.save(existingVote.get());
            }
        } else {
            if (selectedOption != null) {
                selectedOption.setVoteCount(selectedOption.getVoteCount() + 1);
                pollOptionRepository.save(selectedOption);

                Vote vote = new Vote();
                vote.setUser(user);
                vote.setPoll(poll);
                vote.setPollOption(selectedOption);
                voteRepository.save(vote);
            }
        }
        return "redirect:/poll/" + id;
    }
}
