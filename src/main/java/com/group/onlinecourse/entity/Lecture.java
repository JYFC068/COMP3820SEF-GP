package com.group.onlinecourse.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "LECTURES")
public class Lecture {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(length = 2000)
    private String summary;

    @Lob
    private byte[] fileContent;

    @Column(name = "FILE_NAME")
    private String fileName;

    @OneToMany(mappedBy = "lecture", cascade = CascadeType.ALL)
    private List<Comment> comments;
}