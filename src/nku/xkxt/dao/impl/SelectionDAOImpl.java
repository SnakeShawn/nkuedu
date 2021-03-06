package nku.xkxt.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import nku.xkxt.dao.SelectionDAO;
import nku.xkxt.mapper.SelectionMapper;
import nku.xkxt.model.SelectedCourse;
import nku.xkxt.model.Selection;

@Repository
public class SelectionDAOImpl implements SelectionDAO{
	
	@Resource
	private SelectionMapper selectionMapper;
	
	@Override
	public Selection getSelectionById(String id){
		return selectionMapper.getSelectionById(id);
	}
	
	@Override
	public List<Selection> getSelectionByExample(Selection selection){
		return selectionMapper.getSelectionByExample(selection);
	}
	
	@Override
	public List<SelectedCourse> getSelectionByCourse(){
		return selectionMapper.getSelectionByCourse();
	}
	
	@Override
	public int getCourseStatus(String courseId){
		return selectionMapper.getCourseStatus(courseId);
	}
	
	@Override
	public int insertSelection(Selection selection){
		return selectionMapper.insertSelection(selection);
	}
	
	@Override
	public int deleteSelectionByExample(Selection selection){
		return selectionMapper.deleteSelectionByExample(selection);
	} 
	
	@Override
	public List<Selection> getAllSelectionByStuId(String studentId){
		return selectionMapper.getAllSelectionByStuId(studentId);
	}
	
	@Override
	public List<Selection> getAllSelectionByCourseId(String courseId){
		return selectionMapper.getAllSelectionByCourseId(courseId);
	}
	
	@Override
	public int deleteSelectionById(String selectionId){
		return selectionMapper.deleteSelectionById(selectionId);
	}
	
	@Override
	public int updateSelectionByExample(Selection selection){
		return selectionMapper.updateSelectionByExample(selection);
	}
	
	@Override
	public Integer getCountByCourseId(String courseId){
		return selectionMapper.getCountByCourseId(courseId);
	}
	
	@Override
	public Integer getCountByStudentId(String studentId){
		return selectionMapper.getCountByStudentId(studentId);
	}
	
	@Override
	public int overCourse(Selection selection){
		return selectionMapper.overCourse(selection);
	}
	
	@Override
	public int overAllCourse(int isOver){
		return selectionMapper.overAllCourse(isOver);
	}
	
	@Override
	public int addScoreByExample(Selection selection){
		return selectionMapper.addScoreByExample(selection);
	}
	
}
