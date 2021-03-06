package nku.xkxt.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import nku.xkxt.dao.CommentDAO;
import nku.xkxt.mapper.CommentMapper;
import nku.xkxt.model.Comment;

import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO{
	
	@Resource
	private CommentMapper commentMapper;
	
	@Override
	public Comment getCommentById(String id){
		return commentMapper.getCommentById(id);
	}
	
	@Override
	public Comment getCommentBySelectionId(String selectionId){
		return commentMapper.getCommentBySelectionId(selectionId);
	}
	
	@Override
	public int insertComment(Comment comment){
		return commentMapper.insertComment(comment);
	}
	
	@Override
	public List<Comment> getCommentByCourseId(String courseId){
		return commentMapper.getCommentByCourseId(courseId);
	}
	
}
