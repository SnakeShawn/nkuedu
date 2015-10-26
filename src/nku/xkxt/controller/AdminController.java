package nku.xkxt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nku.xkxt.service.AdminService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping(value = "/main")
	public String main(Model model) {
		return "teacher/main";
	}
	
	@RequestMapping(value = "/showStudent")
	public String showStudent(Model model) {
		return "teacher/showStudent";
	}
	
	@RequestMapping(value = "/getStudentList")
	@ResponseBody
	public Map<String,Object> getStudentList(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();	
		adminService.getAllStudentByPage();
		return map;
	}
	

	
	@RequestMapping(value = "/top")
	public String top(Model model) {
		return "teacher/top";
	}
	
	@RequestMapping(value = "/left")
	public String left(Model model) {
		return "teacher/left";
	}
}