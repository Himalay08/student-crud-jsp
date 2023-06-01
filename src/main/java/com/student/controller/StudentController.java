package com.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.student.entity.Search;
import com.student.entity.Student;
import com.student.repository.StudentRepository;
import com.student.service.StudentService;

@Controller

public class StudentController {

	@Autowired
    StudentService studentService;
  
    @Autowired
    private StudentRepository studentRepository;
    
    @PostMapping("/search")
    public String getStudentByName(Search search, Model model) {

    	System.out.println(search);
    	model.addAttribute("studentList", studentRepository.findByName(search.getName()));


        return "ViewStudentList";
    }
	
    @GetMapping({"/", "/viewStudentList"})
    public String viewStudentList(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("studentList", studentService.getAllStudent());
        model.addAttribute("message", message);
        model.addAttribute("search", new Search()); 
        return "ViewStudentList";
    }

    @GetMapping("/addStudent")
    public String addStudent(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("message", message);

        return "AddStudent";
    }

    @PostMapping("/saveStudent")
    public String saveStudent(Student student, RedirectAttributes redirectAttributes) {
        if (studentService.saveOrUpdateStudent(student)) {
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewStudentList";
        }

        redirectAttributes.addFlashAttribute("message", "Save Failure");
        return "redirect:/addStudent";
    }

    @GetMapping("/editStudent/{id}")
    public String editStudent(@PathVariable Integer id, Model model) {
        model.addAttribute("student", studentService.getStudentById(id));

        return "EditStudent";
    }

    @PostMapping("/editSaveStudent")
    public String editSaveStudent(Student student, RedirectAttributes redirectAttributes) {
        if (studentService.saveOrUpdateStudent(student)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewStudentList";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editStudent/" + student.getId();
    }

    @GetMapping("/deleteStudent/{id}")
    public String deleteStudent(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (studentService.deleteStudent(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/viewStudentList";
    }
}
