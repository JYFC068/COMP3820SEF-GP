package com.group.onlinecourse.controller;

import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.repository.LectureRepository;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class DownloadController {

    private final LectureRepository lectureRepository;

    public DownloadController(LectureRepository lectureRepository) {
        this.lectureRepository = lectureRepository;
    }

    @GetMapping("/download/lecture/{id}")
    public ResponseEntity<byte[]> downloadLecture(@PathVariable Long id) {
        Lecture lecture = lectureRepository.findById(id).orElseThrow();

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + lecture.getFileName() + "\"")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(lecture.getFileContent());
    }
}