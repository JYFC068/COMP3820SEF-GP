package com.group.onlinecourse.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String content;
    private LocalDateTime timestamp = LocalDateTime.now();

    @ManyToOne
    private User user;

    @ManyToOne
    private Lecture lecture;

    @ManyToOne
    private Poll poll;

    public Long getId() {return id;}
    public void setId(Long id) {this.id = id;}

    public String getContent() {return content;}
    public void setContent(String content) {this.content = content;}

    public LocalDateTime getTimestamp() {return timestamp;}
    public void setTimestamp(LocalDateTime timestamp) {this.timestamp = timestamp;}

    public User getUser() {return user;}
    public void setUser(User user) {this.user = user;}

    public Lecture getLecture() {return lecture;}
    public void setLecture(Lecture lecture) {this.lecture = lecture;}

    public Poll getPoll() {return poll;}
    public void setPoll(Poll poll) {this.poll = poll;}
}
