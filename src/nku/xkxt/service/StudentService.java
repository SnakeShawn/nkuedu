package nku.xkxt.service;

import nku.xkxt.model.Student;

public interface StudentService {
	
	Student getStudentById(String id);
	
	int registerStudent(Student student);
	
	int getLastStudentNum();
	
}
