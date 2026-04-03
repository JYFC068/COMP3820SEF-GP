package com.group.onlinecourse.service;

import com.group.onlinecourse.entity.Lecture;
import com.group.onlinecourse.repository.LectureRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class LectureService {

    private final LectureRepository lectureRepository;

    public LectureService(LectureRepository lectureRepository) {
        this.lectureRepository = lectureRepository;
    }

    public List<Lecture> getAllLectures() {
        return lectureRepository.findAll();
    }

    public Lecture getLectureById(Long id) {
        return lectureRepository.findById(id).orElse(null);
    }

    public void addLecture(String title, String summary, MultipartFile file) throws IOException {
        Lecture lecture = new Lecture();
        lecture.setTitle(title);
        lecture.setSummary(summary);
        lecture.setFileName(file.getOriginalFilename());
        lecture.setFileContent(file.getBytes());

        lectureRepository.save(lecture);
    }

    public void deleteLecture(Long id) {
        lectureRepository.deleteById(id);
    }
}