package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.SelectedCourse;
import nku.xkxt.model.Selection;

public interface SelectionService {
	
	Selection getSelectionById(String id);
	
	List<Selection> getSelectionByExample(Selection selection);
	
	List<SelectedCourse> getSelectionByCourse();
	
	int insertSelection(Selection selection); 
	
	int getCourseStatus(String courseId);
	
	int deleteSelectionByExample(Selection selection); 
	
	List<Selection> getAllSelectionByStuId(String studentId);
	
	List<Selection> getAllSelectionByCourseId(String courseId);
	
	int deleteSelectionById(String selectionId);
	
	int updateSelectionByExample(Selection selection);
	
	Integer getCountByCourseId(String courseId);
	
	Integer getCountByStudentId(String studentId);
	
	int overCourse(Selection selection);
	
	int overAllCourse(int isOver);
	
	int addScoreByExample(Selection selection);
}
