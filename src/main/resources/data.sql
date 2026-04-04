INSERT INTO users (username, password, role, full_name, email, phone)
VALUES ('teacher1', '11223344', 'TEACHER', 'Chan', 'chan@hkmu.edu.hk', '12345678'),
       ('student1', '22446688', 'STUDENT', 'Yung', 'Yung@hkmu.edu.hk', '87654321'),	
		('Lee123', 'lee1234', 'TEACHER', 'Leeleelee', 'lee809@hkmu.edu.hk', '24681234'),
		('Yung321', 'yung1410', 'STUDENT', 'YungTC', 'YTC@hkmu.edu.hk', '97865342');

INSERT INTO lectures (title, summary, file_path)
VALUES ('Lecture 1: Overview of web applications', 'Introduction to web applications', '/files/L1.pdf'),
	('Lecture 2: Java servlet', 'Servlet basics', '/files/L2.pdf'),
	('Lecture 3: Server-side Java template engine', 'Using JSP/Thymeleaf', '/files/L3.pdf'),
	('Lecture 4: Session', 'Session management in web apps', '/files/L4.pdf'),
	('Lecture 5: MVC', 'Model-View-Controller pattern', '/files/L5.pdf');
INSERT INTO polls (question)
VALUES ('Which topic should be introduced in the next class?'),
       ('Most Interested Lecture.');

INSERT INTO poll_options (poll_id, option_text, vote_count)
VALUES (1, 'Lecture 1', 0),
       (1, 'Lecture 2', 0),
       (1, 'Lecture 3', 0),
       (1, 'Lecture 4', 0),
       (1, 'Lecture 5', 0);

INSERT INTO poll_options (poll_id, option_text, vote_count)
VALUES (2, 'Lecture 1', 0),
       (2, 'Lecture 2', 0),
       (2, 'Lecture 3', 0),
       (2, 'Lecture 4', 0),
       (2, 'Lecture 5', 0);
