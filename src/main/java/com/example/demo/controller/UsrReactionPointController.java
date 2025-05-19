package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value="/usr/reactionPoint/doGoodReaction", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doGoodReaction(HttpServletRequest req, String relTypeCode, int relId, String replaceUri) {
	    int userId = rq.getLoginedMemberId();

	    int usersReaction = reactionPointService.getSumlikeReactionPoint(userId, relTypeCode, relId);
	    int usersOtherReaction = reactionPointService.getSumDislikeReactionPoint(userId, relTypeCode, relId);

	    Map<String, Object> result = new HashMap<>();

	    if(usersReaction == 1) {
	        reactionPointService.deleteLikeReactionPoint(userId, relTypeCode, relId);
	        result.put("resultCode", "S-1");
	        result.put("msg", "좋아요 취소");
	        result.put("replaceUri", replaceUri);
	        return result;
	    }

	    if(usersOtherReaction == -1) {
	    	reactionPointService.deleteDislikeReactionPoint(userId, relTypeCode, relId);
	    	ResultData reactionRd = reactionPointService.increaseReactionPoint(userId, relTypeCode, relId);
	        result.put("resultCode", "F-1");
	        result.put("msg", "이미 싫어요 클릭");
	        result.put("replaceUri", replaceUri);
	        return result;
	    }

	    ResultData reactionRd = reactionPointService.increaseReactionPoint(userId, relTypeCode, relId);

	    result.put("resultCode", reactionRd.getResultCode());
	    result.put("msg", reactionRd.getMsg());
	    result.put("replaceUri", replaceUri);

	    return result;
	}
	
	@RequestMapping(value="/usr/reactionPoint/doBadReaction", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doBadReaction(HttpServletRequest req, String relTypeCode, int relId, String replaceUri) {
	    int userId = rq.getLoginedMemberId();

	    int usersReaction = reactionPointService.getSumDislikeReactionPoint(userId, relTypeCode, relId);
	    int usersOtherReaction = reactionPointService.getSumlikeReactionPoint(userId, relTypeCode, relId);

	    Map<String, Object> result = new HashMap<>();

	    if(usersReaction == -1) {
	        reactionPointService.deleteDislikeReactionPoint(userId, relTypeCode, relId);
	        result.put("resultCode", "S-1");
	        result.put("msg", "싫어요 취소");
	        result.put("replaceUri", replaceUri);
	        return result;
	    }

	    if(usersOtherReaction == 1) {
	    	reactionPointService.deleteLikeReactionPoint(userId, relTypeCode, relId);
	    	ResultData reactionRd = reactionPointService.decreaseReactionPoint(userId, relTypeCode, relId);
	        result.put("resultCode", "F-1");
	        result.put("msg", "이미 좋아요 클릭");
	        result.put("replaceUri", replaceUri);
	        return result;
	    }

	    ResultData reactionRd = reactionPointService.decreaseReactionPoint(userId, relTypeCode, relId);

	    result.put("resultCode", reactionRd.getResultCode());
	    result.put("msg", reactionRd.getMsg());
	    result.put("replaceUri", replaceUri);

	    return result;
	}

}