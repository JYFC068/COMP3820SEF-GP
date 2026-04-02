package com.group.onlinecourse.repository;

import com.group.onlinecourse.entity.Vote;
import com.group.onlinecourse.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface VoteRepository extends JpaRepository<Vote, Long> {
    List<Vote> findByUser(User user);
}

