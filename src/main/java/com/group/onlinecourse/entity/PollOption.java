package com.group.onlinecourse.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "POLL_Options")
public class PollOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "OPTION_TEXT")
    private String optionText;
    @Column(name = "VOTE_COUNT")
    private int voteCount ;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;
}