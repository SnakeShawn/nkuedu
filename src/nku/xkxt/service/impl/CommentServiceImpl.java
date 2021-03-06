package nku.xkxt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.xkxt.dao.CommentDAO;
import nku.xkxt.model.Comment;
import nku.xkxt.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Resource
	private CommentDAO commentDAO;
	
	@Override
	public Comment getCommentById(String id){
		return commentDAO.getCommentById(id);
	}
	
	@Override
	public Comment getCommentBySelectionId(String selectionId){
		return commentDAO.getCommentBySelectionId(selectionId);
	}
	
	@Override
	public int insertComment(Comment comment){
		return commentDAO.insertComment(comment);
	}
	
	@Override
	public List<Comment> getCommentByCourseId(String courseId){
		return commentDAO.getCommentByCourseId(courseId);
	}
	
}
