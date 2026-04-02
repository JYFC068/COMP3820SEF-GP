package com.group.onlinecourse.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Vote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Poll poll;

    @ManyToOne
    private User user;

    @ManyToOne
    private PollOption option;

    private LocalDateTime timestamp = LocalDateTime.now();

    public Long getId() {return id;}
    public void setId(Long id) {this.id = id;}

    public Poll getPoll() {return poll;}
    public void setPoll(Poll poll) {this.poll = poll;}

    public User getUser() {return user;}
    public void setUser(User user) {this.user = user;}

    public PollOption getOption() {return option;}
    public void setOption(PollOption option) {this.option = option;}

    public LocalDateTime getTimestamp() {return timestamp;}
    public void setTimestamp(LocalDateTime timestamp) {this.timestamp = timestamp;}
}
