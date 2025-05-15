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
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleController {

	private final BeforeActionInterceptor beforeActionInterceptor;

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private BoardService boardService;

	UsrArticleController(BeforeActionInterceptor beforeActionInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
	}

	@RequestMapping("/usr/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
		}

		model.addAttribute("article", article);

		return "/usr/article/modify";
	}

	// 로그인 체크 -> 유무 체크 -> 권한체크
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {

		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Ut.jsReplace("F-1", Ut.f("%d번 게시글은 없습니다", id), "../article/list");
		}

		ResultData userCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);

		if (userCanModifyRd.isFail()) {
			return Ut.jsHistoryBack(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
		}

		if (userCanModifyRd.isSuccess()) {
			articleService.modifyArticle(id, title, body);
		}

		article = articleService.getArticleById(id);

		return Ut.jsReplace(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(), "../article/detail?id=" + id);
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

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
		
		articleService.updateView(id);

		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		
		

		model.addAttribute("article", article);
		
		return "usr/article/detail";
	}
	
	@RequestMapping("/usr/article/doUpdateLike")
	@ResponseBody
	public ResultData doUpdateLike(HttpServletRequest req, Model model, int id) {
		
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		
		ResultData increaseLikeCountRd = articleService.updateLike(article, rq.getLoginedMemberId(),id);
		
		if (increaseLikeCountRd.isFail()) {
			return increaseLikeCountRd;
		}
		
		return ResultData.newData(increaseLikeCountRd, "like", articleService.getArticleLikeCount(id));
	}
	

	@RequestMapping("/usr/article/write")
	public String showWrite(HttpServletRequest req) {

		return "usr/article/write";
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String title, String body, String boardId) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isEmptyOrNull(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력하세요");
		}

		if (Ut.isEmptyOrNull(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력하세요");
		}

		if (Ut.isEmptyOrNull(boardId)) {
			return Ut.jsHistoryBack("F-3", "게시판을 선택하세요");
		}

		ResultData doWriteRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);

		int id = (int) doWriteRd.getData1();

		Article article = articleService.getArticleById(id);

		return Ut.jsReplace(doWriteRd.getResultCode(), doWriteRd.getMsg(), "../article/detail?id=" + id);
	}

	@RequestMapping("/usr/article/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, ServletRequest request) throws IOException {

		Rq rq = (Rq) req.getAttribute("rq");

		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.historyBackOnView("존재하지 않는 게시판");
		}
		int itemsInAPage = 10;
		int articlesCount = articleService.getArticleCount(boardId);
		int totalPageNumber = articlesCount / itemsInAPage + 1;

		int pageLimit = 9;
		int cpage = page;

		List<Article> articles = articleService.getForPrintArticles(boardId, itemsInAPage, page);

		
		request.setAttribute("pageLimit", pageLimit);
		request.setAttribute("cpage", cpage);
		request.setAttribute("totalPageNumber", totalPageNumber);
		
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("articles", articles);
		model.addAttribute("board", board);

		return "usr/article/list";
	}
	
	@RequestMapping("/usr/article/search")
	public String showSearchList(HttpServletRequest req, Model model, int search, String keyword,
			@RequestParam(defaultValue = "1") int page, ServletRequest request) throws IOException {

		Rq rq = (Rq) req.getAttribute("rq");
	
		
		if (keyword == null) {
			return rq.historyBackOnView("검색어를 입력하세요.");
		}
		int itemsInAPage = 10;
		int articlesCount = articleService.getKeywordArticleCount(search, keyword);
		int totalPageNumber = articlesCount / itemsInAPage + 1;

		int pageLimit = 9;
		int cpage = page;
		String keywords = keyword;

		List<Article> articles = articleService.getForKeywordPrintArticles(search, keyword, itemsInAPage, page);

		request.setAttribute("keywords", keywords);
		request.setAttribute("pageLimit", pageLimit);
		request.setAttribute("cpage", cpage);
		request.setAttribute("totalPageNumber", totalPageNumber);
		
		
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("articles", articles);

		return "usr/article/search";
	}
}