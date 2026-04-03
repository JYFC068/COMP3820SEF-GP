package com.group.onlinecourse.service;

import com.group.onlinecourse.entity.Comment;
import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.entity.Poll;
import com.group.onlinecourse.entity.User;
import com.group.onlinecourse.repository.CommentRepository;
import com.group.onlinecourse.repository.LectureRepository;
import com.group.onlinecourse.repository.PollRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CommentService {
    private final CommentRepository commentRepository;
    private final LectureRepository lectureRepository;
    private final PollRepository pollRepository;

    public CommentService(CommentRepository commentRepository,
                          LectureRepository lectureRepository,
                          PollRepository pollRepository) {
        this.commentRepository = commentRepository;
        this.lectureRepository = lectureRepository;
        this.pollRepository = pollRepository;
    }

    public List<Comment> getAllComments() {
        return commentRepository.findAll();
    }

    public void saveLectureComment(User user, Long lectureId, String content) {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture != null) {
            Comment comment = new Comment();
            comment.setUser(user);
            comment.setLecture(lecture);
            comment.setContent(content);
            comment.setTimestamp(LocalDateTime.now());
            commentRepository.save(comment);
        }
    }

    public void savePollComment(User user, Long pollId, String content) {
        Poll poll = pollRepository.findById(pollId).orElse(null);
        if (poll != null) {
            Comment comment = new Comment();
            comment.setUser(user);
            comment.setPoll(poll);
            comment.setContent(content);
            comment.setTimestamp(LocalDateTime.now());
            commentRepository.save(comment);
        }
    }

    public List<Comment> getCommentsByUser(User user) {
        return commentRepository.findByUser(user);
    }
}