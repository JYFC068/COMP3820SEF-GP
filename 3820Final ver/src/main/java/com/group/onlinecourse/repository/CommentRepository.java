package com.group.onlinecourse.repository;

import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findByUser(User user);
    List<Comment> findByLecture(Lecture lecture);
    List<Comment> findByPoll(Poll poll);
}