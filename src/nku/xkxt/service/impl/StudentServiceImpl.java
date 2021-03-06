package nku.xkxt.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.core.common.Constants;
import nku.xkxt.dao.StudentDAO;
import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Resource
	private StudentDAO studentDAO;
	
	@Override
	public Student getStudentById(String id){
		return studentDAO.getStudentById(id);
	}
	
	@Override
	public int  registerStudent(Student student){
		String email = student.getEmail();
		List<Student> stu = studentDAO.checkStudentByEmail(email);
		if(stu.size() != 0){
			return Constants.EMAIL_USED;
		}
		if (studentDAO.insertStudent(student)>0){
			return Constants.SUCCESS_REGISTER;
		} else {
			return  Constants.INSERT_FAILURE;
		}
	}
	
	@Override
	public int getLastStudentNum(){
		return studentDAO.getLastStudentNum();
	}
	
	@Override
	public String getStudentNumByEmail(String email){
		return studentDAO.getStudentNumByEmail(email);
	}
	
	@Override
	public Student getStudentByNum(int studentNum){
		return studentDAO.getStudentByNum(studentNum);
	}
	
	@Override
	public int studentCheckLogin(int studentNum, String password){
		Student student = studentDAO.getStudentByNum(studentNum);
		if (student == null){
			return Constants.NO_SUCH_USER;
		} else {
			if (!password.equals(student.getPasswd())){
				return Constants.WRONG_PWD;
			} else {
				return Constants.SUCCESS_LOGIN;
			}
		}
	}
	
	@Override
	public int updateStudentByExample(Student student){
		return studentDAO.updateStudentByExample(student);
	}
}
