package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.interceptor.BeforeActionInterceptor;
import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.CommentService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Comment;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrCommentController {

	private final BeforeActionInterceptor beforeActionInterceptor;

	@Autowired
	private Rq rq;

	@Autowired
	private CommentService commentService;

	@Autowired
	private ArticleService articleService;

	UsrCommentController(BeforeActionInterceptor beforeActionInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
	}
	
	@RequestMapping("/usr/comment/modify")
	public String showModify(HttpServletRequest req, Model model, int articleId, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), articleId);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", articleId));
		}
		
		Comment comment = commentService.getForPrintComment(rq.getLoginedMemberId(), id);

		if (comment == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 없습니다", id));
		}

		model.addAttribute("article", article);
		model.addAttribute("comment", comment);

		return "/usr/comment/modify";
	}

	// 로그인 체크 -> 유무 체크 -> 권한체크
	@RequestMapping("/usr/comment/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, Integer id, String body) {

		Rq rq = (Rq) req.getAttribute("rq");

		Comment comment = commentService.getCommentById(id);

		if (comment == null) {
			return Ut.jsReplace("F-1", Ut.f("%d번 댓글은 없습니다", id), "../article/list");
		}

		ResultData userCanModifyRd = commentService.userCanModify(rq.getLoginedMemberId(), comment);

		if (userCanModifyRd.isFail()) {
			return Ut.jsHistoryBack(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
		}

		if (userCanModifyRd.isSuccess()) {
			commentService.modifyComment(id, body);
		}

		comment = commentService.getCommentById(id);

		return Ut.jsReplace(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(),"../article/detail?id="+comment.getArticleId());
	}

	@RequestMapping("/usr/comment/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Comment comment = commentService.getCommentById(id);

		if (comment == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}

		ResultData userCanDeleteRd = commentService.userCanDelete(rq.getLoginedMemberId(), comment);

		if (userCanDeleteRd.isFail()) {
			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
		}

		if (userCanDeleteRd.isSuccess()) {
			commentService.deleteComment(id);
		}

		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(),"../article/detail?id="+comment.getArticleId());
	}
	
	@RequestMapping("/usr/comment/write")
	public String showWrite(HttpServletRequest req) {
		return "usr/comment/write";
	}

	@RequestMapping("/usr/comment/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String body, Integer articleId) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isEmptyOrNull(body)) {
			return Ut.jsHistoryBack("F-1", "내용을 입력하세요");
		}
		
		if (articleId == null) {
		    return Ut.jsHistoryBack("F-2", "articleId가 필요합니다.");
		}
	

		ResultData doWriteRd = commentService.writeComment(rq.getLoginedMemberId(), articleId, body);

		int id = (int) doWriteRd.getData1();

		Comment comment = commentService.getCommentById(id);
		

		return Ut.jsReplace(doWriteRd.getResultCode(), doWriteRd.getMsg(),"../article/detail?id="+comment.getArticleId());
	}
	
}