package com.group.onlinecourse.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Poll{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String question;

    @OneToMany(mappedBy = "poll", cascade = CascadeType.ALL)
    private List<PollOption> options;

    public Long getId() {return id;}
    public void setId(Long id) {this.id = id;}

    public String getQuestion() {return question;}
    public void setQuestion(String question) {this.question = question;}

    public List<PollOption> getOptions() {return options;}
    public void setOptions(List<PollOption> options) {this.options = options;}
}
