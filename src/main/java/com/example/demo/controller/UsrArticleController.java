package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData doModify(HttpSession session, int id, String title, String body) {
		
		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}
		
		if (!isLogined) {
			return ResultData.from("F-A", "로그인 후 이용바랍니다.");
		}

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}
		
		if (!session.getAttribute("loginedMemberId").equals(article.getWriter())) {
			return ResultData.from("F-2", "수정 권한이 없습니다.");
		}

		articleService.modifyArticle(id, title, body);
		
		article = articleService.getArticleById(id);

		return ResultData.from("S-1", Ut.f("%d번 게시글이 수정되었습니다", id),"수정한 게시글", article);
	}

	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData getArticle(int id) {

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글입니다", id),"선택한 게시글", article);
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData doDelete(HttpSession session, int id) {
		
		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}
		
		if (!isLogined) {
			return ResultData.from("F-A", "로그인 후 이용바랍니다.");
		}
		

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}
		
		if (!session.getAttribute("loginedMemberId").equals(article.getWriter())) {
			return ResultData.from("F-2", "삭제 권한이 없습니다.");
		}

		articleService.deleteArticle(id);

		return ResultData.from("S-1", Ut.f("%d번 게시글이 삭제되었습니다", id));
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData doWrite(HttpSession session, String title, String body) {
		
		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}
		
		if (!isLogined) {
			return ResultData.from("F-A", "로그인 후 이용바랍니다.");
		}


		if (Ut.isEmptyOrNull(title)) {
			return ResultData.from("F-1", "제목을 입력하세요");
		}

		if (Ut.isEmptyOrNull(body)) {
			return ResultData.from("F-2", "내용을 입력하세요");
		}

		ResultData writeArticleRd = articleService.writeArticle(session, title, body);

		int id = (int) writeArticleRd.getData1();

		Article article = articleService.getArticleById(id);

		return ResultData.from(writeArticleRd.getResultCode(), writeArticleRd.getMsg(),"새로 추가된 게시글", article);
	}

	@RequestMapping("/usr/article/getArticles")

	public ResultData<List<Article>> getArticles() {
	    List<Article> articles = articleService.getArticles();
	    return ResultData.from("S-1", "Article List", "전체게시글", articles);
	}
	
	@RequestMapping("/usr/article/list")
	public String showList(HttpServletRequest request) {
	    ResultData<List<Article>> rd = getArticles();
	    List<Article> articles = rd.getData1();
	    request.setAttribute("articles", articles);
	    return "/usr/article/list";
	}
	
	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest request, int id) {
	    ResultData<Article> rd = getArticle(id);
	    Article article = rd.getData1();
	    request.setAttribute("article", article);
	    return "/usr/article/detail";
	}
	
}
