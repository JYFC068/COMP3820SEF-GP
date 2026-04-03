package com.group.onlinecourse.service;

import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.PollOption;
import com.group.onlinecourse.repository.PollOptionRepository;
import com.group.onlinecourse.repository.PollRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PollService {
    private final PollRepository pollRepository;
    private final PollOptionRepository pollOptionRepository;

    public PollService(PollRepository pollRepository, PollOptionRepository pollOptionRepository) {
        this.pollRepository = pollRepository;
        this.pollOptionRepository = pollOptionRepository;
    }

    public List<Poll> getAllPolls() {
        return pollRepository.findAll();
    }

    public Poll getPollById(Long id) {
        return pollRepository.findById(id).orElse(null);
    }

    @Transactional
    public void createPollWithFiveOptions(String question, String[] options) {
        Poll poll = new Poll();
        poll.setQuestion(question);
        Poll savedPoll = pollRepository.save(poll);

        if (options != null) {
            for (String text : options) {
                if (text != null && !text.trim().isEmpty()) {
                    PollOption option = new PollOption();
                    option.setOptionText(text.trim());
                    option.setVoteCount(0);
                    option.setPoll(savedPoll);
                    pollOptionRepository.save(option);
                }
            }
        }
    }

    @Transactional
    public void castVote(Long optionId) {
        PollOption option = pollOptionRepository.findById(optionId)
                .orElseThrow(() -> new RuntimeException("Option not found"));
        option.setVoteCount(option.getVoteCount() + 1);
        pollOptionRepository.save(option);
    }

    public void deletePoll(Long id) {
        pollRepository.deleteById(id);
    }
}