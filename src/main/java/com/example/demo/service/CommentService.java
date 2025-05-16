package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.repository.CommentRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Comment;
import com.example.demo.vo.ResultData;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;

	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}

	public ResultData writeComment(int memberId, int articleId,  String body) {
		commentRepository.writeComment(memberId, articleId, body);

		int id = commentRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 글이 등록되었습니다", id), "등록 된 게시글 id", id);
	}

	public void deleteComment(int id) {
		commentRepository.deleteComment(id);
	}

	public void modifyComment(int id,  String body) {
		commentRepository.modifyComment(id, body);
	}

	public ResultData userCanModify(int loginedMemberId, Comment comment) {

		if (comment.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 댓글에 대한 수정 권한 없음", comment.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 댓글 수정 가능", comment.getId()));
	}

	public ResultData userCanDelete(int loginedMemberId, Comment comment) {
		if (comment.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 댓글에 대한 삭제 권한 없음", comment.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 댓글 삭제 가능", comment.getId()));
	}

	public Comment getForPrintComment(int loginedMemberId, int id) {

		Comment comment = commentRepository.getForPrintComment(id);

		controlForPrintData(loginedMemberId, comment);

		return comment;
	}

	private void controlForPrintData(int loginedMemberId, Comment comment) {
		if (comment == null) {
			return;
		}

		ResultData userCanModifyRd = userCanModify(loginedMemberId, comment);
		comment.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userDeleteRd = userCanDelete(loginedMemberId, comment);
		comment.setUserCanDelete(userDeleteRd.isSuccess());
	}

	public Comment getCommentById(int id) {
		return commentRepository.getCommentById(id);
	}

	public List<Comment> getComments() {
		return commentRepository.getComments();
	}

	public List<Comment> getForPrintComments(int articleId) {
		// SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 0, 10;
		// --> 1page
		// SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 10, 10;
		// --> 2page

		return commentRepository.getForPrintComments(articleId);
	}

	public int getCommentCount(int articleId) {
		return commentRepository.getCommentCount(articleId);
	}
	
	public int getKeywordCommentCount(int search, String keyword) {
		return commentRepository.getKeywordCommentCount(search, keyword);
	}

	public List<Comment> getForKeywordPrintComments(int search, String keyword, int itemsInAPage, int page) {
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return commentRepository.getForKeywordPrintComments(search, keyword, limitFrom, limitTake);
	}


	public ResultData increaseLikeCount(int id) {
		return commentRepository.increaseLikeCount(id);
	}

	public int getCommentLikeCount(int id) {
		return commentRepository.getArticleLikeCount(id);
	}
	
}