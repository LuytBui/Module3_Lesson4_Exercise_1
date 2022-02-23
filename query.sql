USE QuanLySinhVien;

SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

#Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
SELECT student.studentID, student.studentName, AVG(mark.mark) AS "Diem TB"
FROM student JOIN mark ON student.studentId = mark.studentId
GROUP BY studentId;

#Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 13
SELECT student.studentID, student.studentName, AVG(mark.mark) AS `Diem TB`
FROM student JOIN mark ON student.studentId = mark.studentId
GROUP BY studentId
HAVING `Diem TB` > 13;

#Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT student.studentID, student.studentName, AVG(mark.mark) AS `Diem TB`
FROM student JOIN mark ON student.studentId = mark.studentId
GROUP BY studentId
HAVING `Diem TB` >= ALL
	(SELECT AVG(mark.mark)
    FROM mark
	GROUP BY studentId
    )
;