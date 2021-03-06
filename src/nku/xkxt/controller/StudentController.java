package nku.xkxt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nku.core.common.Constants;
import nku.core.utils.UUIDGenerator;
import nku.xkxt.model.Comment;
import nku.xkxt.model.Course;
import nku.xkxt.model.CourseTime;
import nku.xkxt.model.CourseWithTime;
import nku.xkxt.model.SelectedCourse;
import nku.xkxt.model.Selection;
import nku.xkxt.model.Student;
import nku.xkxt.service.AdminService;
import nku.xkxt.service.CommentService;
import nku.xkxt.service.CourseService;
import nku.xkxt.service.CourseTimeService;
import nku.xkxt.service.SelectionService;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@Resource
	private AdminService adminService;
	@Resource
	private StudentService studentService;
	@Resource
	private CourseService courseService;
	@Resource
	private CourseTimeService courseTimeService;
	@Resource
	private SelectionService selectionService;
	@Resource
	private CommentService commentService;
	
	@RequestMapping(value = "/main")
	public String main(Model model) {
		return "student/main";
	}
	
	@RequestMapping(value = "/personalInfo")
	public String personalInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		model.addAttribute("student", student);
		return "student/personalInfo";
	}
	
	@RequestMapping(value = "/top")
	public String top(Model model) {
		return "student/top";
	}
	
	@RequestMapping(value = "/topMenu")
	public String topMenu(Model model) {
		return "student/topMenu";
	}
	
	@RequestMapping(value = "/left")
	public String left(Model model) {
		return "student/left";
	}
	
	@RequestMapping(value = "/xksc")
	public String xksc(Model model) {
		return "student/xksc";
	}
	
	@RequestMapping(value = "/getCourseList")
	@ResponseBody
	public Map<String,Object> getCourseList(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String pageNum = request.getParameter("pageNo");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<Course> courseList = courseService.getAllOpenCourseByPage();
		PageInfo<Course> page = new PageInfo<Course>(courseList);
		List<CourseWithTime> courseWTList = new ArrayList<CourseWithTime>();
		for (Course course : courseList) {
			CourseWithTime cwt = new CourseWithTime();
			List<CourseTime> courseTimeList = courseTimeService.getCourseTimeByCourseId(course.getId());
			cwt.setCourseTime(courseTimeList);
			cwt.setSelectId(course.getSelectId());
			cwt.setName(course.getName());
			cwt.setMaxStudent(course.getMaxStudent());
			cwt.setProfessor(course.getProfessor());
			cwt.setClassroom(course.getClassroom());
			cwt.setRequest(course.getRequest());
			cwt.setIntroduction(course.getIntroduction());
			cwt.setType(course.getType());
			cwt.setCredit(course.getCredit());
			cwt.setSelectedCount(selectionService.getCountByCourseId(course.getId()));
			courseWTList.add(cwt);
		}
		map.put("page", page);
		map.put("courseList", courseWTList);
		return map;
	}
	
	@RequestMapping(value = "/showCourseIntro")
	public String showCourseIntro(Model model,HttpServletRequest request) {
		String name = request.getParameter("name");
		String introduction = request.getParameter("introduction");
		introduction = introduction.replace("@","\n");
		Course course = new Course();
		course.setName(name);
		course.setIntroduction(introduction);
		model.addAttribute("course", course);
		return "student/showCourseIntro";
	}
	
	@RequestMapping(value = "/selectClass")
	public String selectClass(Model model, HttpServletRequest request) {
		
		Integer systemStatus = adminService.getSystemStatus();
		if (systemStatus == 0){
			return "student/systemClosed";
		} else {
			HttpSession session = request.getSession();
			String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
			Student student = new Student();
			if (stuNumStr != null&& !"".equals(stuNumStr)){
				student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
			}
			
			model.addAttribute("student", student);
			return "student/selectClass";
		}
	}
	
	@RequestMapping(value = "/getSelectedCourse")
	@ResponseBody
	public Map<String,Object> getSelectedCourse(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		
		String studentId = request.getParameter("studentId");
		
		List<Selection> selectionList = selectionService.getAllSelectionByStuId(studentId);
		List<Course> courseList = new ArrayList<Course>();
		for(int i=0;i<selectionList.size();i++){
			Selection selection = selectionList.get(i);
			Course co = courseService.getCourseById(selection.getCourseId());
			if (co!=null){
				courseList.add(co);
			}
		}
		
		map.put("courseList", courseList);
		return map;
	}
	
	@RequestMapping(value = "/addSelection")
	@ResponseBody
	public Map<String,Object> addSelection(HttpServletRequest request){
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();
		
		String selectId = request.getParameter("selectId");
		Course course = courseService.getCourseBySelectId(selectId);
		if (course == null){
			msg = "不存在此课程，请参照选课系统查看选课序号！";
			map.put("error", msg);
			return map;
		}
		if (course.getMaxStudent() <= selectionService.getCountByCourseId(course.getId())){
			msg = "课程已选人数已达上限！";
			map.put("error", msg);
			return map;
		}
		
		if (selectionService.getCourseStatus(course.getId()) == 1){
			msg = "当前课程已结课，不能选择！";
			map.put("error", msg);
			return map;
		}
		
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		Selection selection = new Selection();
		selection.setCourseId(course.getId());
		selection.setStudentId(student.getId());
		
		List<Selection> selectList = selectionService.getSelectionByExample(selection);
		if (selectList.size() != 0){
			msg = "选课失败，您已经选过此课程！";
			map.put("error", msg);
			return map;
		}
		
		if (2 <= selectionService.getCountByStudentId(student.getId())){
			msg = "您的可选课程数已达上限！";
			map.put("error", msg);
			return map;
		}
		
		List<Selection> selectedList = selectionService.getAllSelectionByStuId(student.getId());	//当前学生已选的所有课程
		for (int i = 0; i < selectedList.size(); i++) {	//课程时间冲突判断，需要选出当前学生的所有已选课程的所有开课时间，与当前所选课程的所有开课时间对比
			Selection sel = selectedList.get(i);
			Course cou = courseService.getCourseById(sel.getCourseId());
			List<CourseTime> courseTimeList = courseTimeService.getCourseTimeByCourseId(course.getId());
			List<CourseTime> couTimeList = courseTimeService.getCourseTimeByCourseId(cou.getId());
			for (int j = 0; j < courseTimeList.size(); j++) {
				CourseTime courseTime = courseTimeList.get(j);
				for (int k = 0; k < couTimeList.size(); k++) {
					CourseTime ct = couTimeList.get(k);
					if ((courseTime.getCourseDay()).equals(ct.getCourseDay())) {
						if (((courseTime.getStartTime()) >= ct.getStartTime() && (courseTime.getStartTime()) <= ct.getEndTime())
								|| ((courseTime.getEndTime()) >= ct.getStartTime() && (courseTime.getEndTime()) <= ct.getEndTime())) {
							msg = "选课失败，此课程与您所选课程时间冲突!";
							map.put("error", msg);
							return map;
						}
					}
				}
			}

		}	
		
		selection.setId(UUIDGenerator.getUUID());
		if (selectionService.insertSelection(selection)>0){
			msg = "选课成功！";
			map.put("msg", msg);
			return map;
		} else {
			msg = "选课失败，请检查信息！";
			map.put("error", msg);
			return map;
		}
	}
	
	@RequestMapping(value = "/deleteSelection")
	@ResponseBody
	public Map<String,Object> deleteSelection(HttpServletRequest request){
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();
		
		String selectId = request.getParameter("selectId");
		Course course = courseService.getCourseBySelectId(selectId);
		if (course == null){
			msg = "不存在此课程，请参照选课系统查看选课序号！";
			map.put("error", msg);
			return map;
		}
		
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		Selection selection = new Selection();
		selection.setCourseId(course.getId());
		selection.setStudentId(student.getId());
		
		List<Selection> selectList = selectionService.getSelectionByExample(selection);
		if (selectList.size() == 0){
			msg = "退课失败，您没有选过的课程！";
			map.put("error", msg);
			return map;
		} else {
			if (selectionService.deleteSelectionByExample(selection)>0){
				msg = "退课成功！";
				map.put("msg", msg);
				return map;
			} else {
				msg = "退课失败，请检查信息！";
				map.put("error", msg);
				return map;
			}
		}
	}
	@RequestMapping(value = "/selectedClass")
	public String selectedClass(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		
		model.addAttribute("student", student);
		return "student/selectedClass";
	}
	
	@RequestMapping(value = "/getSelectedCourseWithTime")
	@ResponseBody
	public Map<String,Object> getSelectedCourseWithTime(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		
		String studentId = request.getParameter("studentId");
		
		List<Selection> selectionList = selectionService.getAllSelectionByStuId(studentId);
		List<Course> courseList = new ArrayList<Course>();
		for(int i=0;i<selectionList.size();i++){
			Selection selection = selectionList.get(i);
			Course co = courseService.getCourseById(selection.getCourseId());
			if (co!=null){
				courseList.add(co);
			}
		}
		List<CourseWithTime> courseWTimeList = new ArrayList<CourseWithTime>();
		for (Course course : courseList) {
			CourseWithTime cwt = new CourseWithTime();
			List<CourseTime> courseTimeList = courseTimeService.getCourseTimeByCourseId(course.getId());
			cwt.setCourseTime(courseTimeList);
			cwt.setSelectId(course.getSelectId());
			cwt.setName(course.getName());
			cwt.setMaxStudent(course.getMaxStudent());
			cwt.setProfessor(course.getProfessor());
			cwt.setClassroom(course.getClassroom());
			cwt.setRequest(course.getRequest());
			cwt.setIntroduction(course.getIntroduction());
			cwt.setType(course.getType());
			cwt.setCredit(course.getCredit());
			courseWTimeList.add(cwt);
		}
		
		map.put("courseList", courseWTimeList);
		return map;
	}
	
	@RequestMapping(value = "/schedule")
	public String schedule(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		
		model.addAttribute("student", student);
		return "student/schedule";
	}
	
	@RequestMapping(value = "/help")
	public String home(Model model) {
		return "student/help";
	}
	
	@RequestMapping(value = "/scoreQuery")
	public String scoreQuery(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		
		model.addAttribute("student", student);
		return "student/scoreQuery";
	}
	
	@RequestMapping(value = "/getSelectionByCourse")
	@ResponseBody
	public Map<String,Object> getSelectionByCourse(HttpServletRequest request){
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		Map<String,Object> map = new HashMap<String,Object>();
		List<Selection> selectionList = selectionService.getAllSelectionByStuId(student.getId());
		List<SelectedCourse> courseList = new ArrayList<SelectedCourse>();
		for(int i=0;i<selectionList.size();i++){
			Selection selection = selectionList.get(i);
			SelectedCourse sc = new SelectedCourse();
			Course co = courseService.getCourseById(selection.getCourseId());
			
			if (co!=null){
				sc.setCourseId(selection.getCourseId());
				sc.setCourseNum(co.getCourseNum());
				sc.setId(selection.getId());
				sc.setIsOver(selection.getIsOver());
				sc.setName(co.getName());
				sc.setProfessor(co.getProfessor());
				Comment comment = commentService.getCommentBySelectionId(selection.getId());
				if (comment == null){
					sc.setScore(-1f);
				} else {
					sc.setScore(selection.getScore());
				}
				sc.setSelectId(co.getSelectId());
				sc.setCredit(co.getCredit());
				courseList.add(sc);
			}
		}
		
		map.put("courseList", courseList);
		return map;
	}
	
	@RequestMapping(value = "/evaluate")
	public String evaluate(Model model) {
		Integer systemStatus = adminService.getSystemStatus();
		if (systemStatus == 0){
			return "student/systemClosed";
		} else {
			return "student/evaluate";
		}
	}
	
	@RequestMapping(value = "/doEvaluate")
	public String doEvaluate(Model model,HttpServletRequest request) {
		Integer systemStatus = adminService.getSystemStatus();
		String selectionId = request.getParameter("selectionId");
		if (systemStatus == 0){
			return "student/systemClosed";
		} else {
			model.addAttribute("selectionId", selectionId);
			return "student/doEvaluate";
		}
	}
	
	@RequestMapping(value = "/addEvaluate")
	@ResponseBody
	public Map<String,Object> addEvaluate(HttpServletRequest request){
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();
		
		String c1 = request.getParameter("c1");
		String c2 = request.getParameter("c2");
		String c3 = request.getParameter("c3");
		String c4 = request.getParameter("c4");
		String c5 = request.getParameter("c5");
		String c6 = request.getParameter("c6");
		String content = request.getParameter("content");
		String selectionId = request.getParameter("selectionId");
		Comment comment = new Comment();
		comment.setId(UUIDGenerator.getUUID());
		comment.setScore1(Integer.parseInt(c1));
		comment.setScore2(Integer.parseInt(c2));
		comment.setScore3(Integer.parseInt(c3));
		comment.setScore4(Integer.parseInt(c4));
		comment.setScore5(Integer.parseInt(c5));
		comment.setScore6(Integer.parseInt(c6));
		comment.setComment(content);
		comment.setSelectionId(selectionId);
		
		comment.setTotal(calculateTotal(comment));
		
		if (commentService.insertComment(comment)>0){
			msg = "评教成功！";
			map.put("msg", msg);
			return map;
		} else {
			msg = "评教失败，请检查信息！";
			map.put("error", msg);
			return map;
		}
	}
	
	@RequestMapping(value = "/blank")
	public String blank(Model model) {
		return "student/blank";
	}
	
	private Float calculateTotal(Comment comment) {
		//各个分数比例为：15%,15%,15%,15%,15%,25%
		Float total = null;	
		Float temp = (float) (comment.getScore1() * 0.15)
				+ (float) (comment.getScore2() * 0.15)
				+ (float) (comment.getScore3() * 0.15)
				+ (float) (comment.getScore4() * 0.15)
				+ (float) (comment.getScore5() * 0.15)
				+ (float) (comment.getScore6() * 0.25);
		total = temp*20;
		return total;
	}
}
