package com.group.onlinecourse.repository;

import com.group.onlinecourse.entity.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LectureRepository extends JpaRepository<Lecture, Long> {

}
