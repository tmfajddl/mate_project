package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleController {
	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;

	// 로그인 체크 -> 유무 체크 -> 권한체크
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined() == false) {
			return Ut.jsReplace("F-A", "로그인 후 이용하세요", "../member/login");
		}

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}

		ResultData userCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);

		if (userCanModifyRd.isFail()) {
			return Ut.jsHistoryBack(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
		}

		if (userCanModifyRd.isSuccess()) {
			articleService. modifyArticle(id,title,body);
		}

		return Ut.jsReplace(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(), "../article/list");

	}
	
	@RequestMapping("/usr/article/modify")
	public String modify(Model model, int id) {
	    Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);

	    if (article == null) {
	        return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
	    }

	    model.addAttribute("article", article);
	    return "usr/article/modify";
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined() == false) {
			return Ut.jsReplace("F-A", "로그인 후 이용하세요", "../member/login");
		}

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}

		ResultData userCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);

		if (userCanDeleteRd.isFail()) {
			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
		}

		if (userCanDeleteRd.isSuccess()) {
			articleService.deleteArticle(id);
		}

		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(), "../article/list");
	}

	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);

		model.addAttribute("article", article);

		return "usr/article/detail";
	}
	
	@RequestMapping("/usr/article/write")
	public String write(Model model, HttpServletRequest req) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		return "usr/article/write";	
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, Model model, String title, String body) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined() == false) {
			return Ut.jsReplace("F-A", "로그인 후 이용하세요", "../member/login");
		}

		if (Ut.isEmptyOrNull(title)) {
			return Ut.jsReplace("F-1", "제목을 입력하세요", "../article/write");
		}

		if (Ut.isEmptyOrNull(body)) {
			return Ut.jsReplace("F-2", "내용을 입력하세요", "../article/write");
		}

		ResultData doWriteRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body);

		int id = (int) doWriteRd.getData1();

		Article article = articleService.getArticleById(id);


		return Ut.jsReplace("S-1", "글쓰기 성공", "../article/list");
	}

	@RequestMapping("/usr/article/list")
	public String showList(Model model, HttpServletRequest req) {
		
		Rq rq = (Rq) req.getAttribute("rq");

		List<Article> articles = articleService.getArticles();

		model.addAttribute("articles", articles);
		model.addAttribute("rq", rq);

		return "usr/article/list";
	}
}