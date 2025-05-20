package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Article;
import com.example.demo.vo.Comment;
import com.example.demo.vo.ResultData;

@Mapper
public interface CommentRepository {

	public int writeComment(int memberId, int articleId,  String body);

	public void deleteComment(int id);

	public void modifyComment(int id, String body);

	public int getLastInsertId();

	public Comment getCommentById(int id);

	public List<Comment> getComments();

	public Comment getForPrintComment(int loginedMemberId);

	public List<Comment> getForPrintComments(int articleId);

	public int getCommentCount(int boardId);

	public int getKeywordCommentCount(int search, String keyword);

	public List<Comment> getForKeywordPrintComments(int search, String keyword, int limitFrom, int limitTake);

	public ResultData increaseLikeCount(int id);

	public int getArticleLikeCount(int id);

	public void increaseGoodReactionPoint(int relId);

	public void increaseBadReactionPoint(int relId);

	public void decreaseGoodReactionPoint(int relId);

	public void decreaseBadReactionPoint(int relId);
	
}