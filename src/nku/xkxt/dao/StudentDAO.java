package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.Student;

public interface StudentDAO {
	
	Student getStudentById(String id);
	
	int insertStudent(Student student);
	
	int getLastStudentNum();
	
	List<Student> checkStudentByEmail(String email);
	
	String getStudentNumByEmail(String email);
}
