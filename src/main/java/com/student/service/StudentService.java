package com.student.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.entity.Student;
import com.student.repository.StudentRepository;

@Service
public class StudentService {
	
	    @Autowired
	    StudentRepository studentRepo;

	    public List<Student> getAllStudent() {
	        List<Student> studentList = new ArrayList<>();
	        studentRepo.findAll().forEach(anime -> studentList.add(anime));

	        return studentList;
	    }

	    public Student getStudentById(Integer id) {
	        return studentRepo.findById(id).get();
	    }

	    public boolean saveOrUpdateStudent(Student student) {
	        Student updatedStudent = studentRepo.save(student);

	        if (studentRepo.findById(updatedStudent.getId()) != null) {
	            return true;
	        }

	        return false;
	    }

	    public boolean deleteStudent(Integer id) {
	        studentRepo.deleteById(id);

	        if (studentRepo.findById(id) != null) {
	            return true;
	        }

	        return false;
	    }


}
