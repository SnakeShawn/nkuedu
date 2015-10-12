package nku.xkxt.controller;

import javax.annotation.Resource;

import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/client")
public class LoginController {
	
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value = "/home")
	public String home(Model model) {
		Student student = studentService.getStudentById("1");
		model.addAttribute("student", student);
		return "login";
	}
	@RequestMapping(value = "/index")
	public String index(Model model) {
		Student student = studentService.getStudentById("1");
		model.addAttribute("student", student);
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public String login(Model model) {
		Student student = studentService.getStudentById("1");
		model.addAttribute("student", student);
		return "index";
	}
	
}
