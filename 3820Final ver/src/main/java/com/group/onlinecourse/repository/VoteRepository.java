package com.group.onlinecourse.repository;

import com.group.onlinecourse.entity.Vote;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.PollOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

public interface VoteRepository extends JpaRepository<Vote, Long> {
    List<Vote> findByUser(User user);

    Optional<Vote> findByPollAndUser(Poll poll, User user);

    Optional<Vote> findByPollOptionAndUser(PollOption pollOption, User user);
}

