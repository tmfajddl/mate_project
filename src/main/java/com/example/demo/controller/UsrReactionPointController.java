package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrReactionPointController {

	private final UsrArticleController usrArticleController;

	@Autowired
	private Rq rq;

	@Autowired
	private ReactionPointService reactionPointService;

	UsrReactionPointController(UsrArticleController usrArticleController) {
		this.usrArticleController = usrArticleController;
	}

	@RequestMapping("/usr/reactionPoint/doGoodReaction")
	@ResponseBody
	public String doGoodReaction(HttpServletRequest req, String relTypeCode, int relId, String replaceUri) {

		int usersReaction = reactionPointService.getSumlikeReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
		int usersOtherReaction = reactionPointService.getSumDislikeReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
		
		if (usersReaction == 1) {
			ResultData reactionRd = reactionPointService.deleteLikeReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
			return Ut.jsReplace("S-1", "좋아요 취소", replaceUri);
		}
		
		if (usersOtherReaction == -1) {
			return Ut.jsReplace("F-1", "이미 싫어요 클릭", replaceUri);
		}

		ResultData reactionRd = reactionPointService.increaseReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);

		return Ut.jsReplace(reactionRd.getResultCode(), reactionRd.getMsg(), replaceUri);
	}
	
	@RequestMapping("/usr/reactionPoint/doBadReaction")
	@ResponseBody
	public String doBadReaction(HttpServletRequest req, String relTypeCode, int relId, String replaceUri) {

		int usersReaction = reactionPointService.getSumDislikeReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
		int usersOtherReaction = reactionPointService.getSumlikeReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
		
		
		if (usersReaction == -1) {
			ResultData reactionRd = reactionPointService.deleteDislikeReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
			return Ut.jsReplace("S-1", "싫어요 취소", replaceUri);
		}
		
		if (usersOtherReaction == 1) {
			return Ut.jsReplace("F-1", "이미 좋아요 클릭", replaceUri);
		}

		ResultData reactionRd = reactionPointService.decreaseReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);

		return Ut.jsReplace(reactionRd.getResultCode(), reactionRd.getMsg(), replaceUri);
	}

}