package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.service.SurveyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Survey;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SurveyController {
	
	@Autowired
	private Rq rq;

	@Autowired
	private MemberService memberService;

    @Autowired
    private SurveyService surveyService;
    
    @RequestMapping("/usr/member/modifyStyle")
	public String showModify(HttpServletRequest req, Model model) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		if (rq.getLoginedMemberId() == 0) {
		    return Ut.jsHistoryBack("F-1", Ut.f("로그인 후 이용바랍니다"));
		}

		Survey survey = surveyService. getSurveyById(rq.getLoginedMemberId());

		model.addAttribute("survey", survey);

		return "/usr/member/style";
	}

    @RequestMapping("/usr/member/insertStyle")
    public String insertStyle(HttpServletRequest req,
                               @RequestParam(value = "seat", required = false) List<String> seatPreferences,
                               @RequestParam("gender") String mateGender,
                               @RequestParam(value = "style", required = false) List<String> cheeringStyles) {

        Rq rq = (Rq) req.getAttribute("rq");
        int memberId = rq.getLoginedMemberId();

        // List<String>을 콤마로 연결 (DB 컬럼 형식에 맞게)
        String seatPreference = seatPreferences != null ? String.join(",", seatPreferences) : "";
        String cheeringStyle = cheeringStyles != null ? String.join(",", cheeringStyles) : "";

        // 기존 설문조사 정보 조회
        Survey existingSurvey = surveyService.getSurveyById(memberId);

        if (existingSurvey != null) {
            // 기존 정보가 있으면 update
            existingSurvey.setSeatPreference(seatPreference);
            existingSurvey.setMateGender(mateGender);
            existingSurvey.setCheeringStyle(cheeringStyle);
            surveyService.updateSurvey(existingSurvey); // 새로 update 메서드 필요!
        } else {
            // 없으면 새로 insert
            Survey newSurvey = new Survey();
            newSurvey.setMemberId(memberId);
            newSurvey.setSeatPreference(seatPreference);
            newSurvey.setMateGender(mateGender);
            newSurvey.setCheeringStyle(cheeringStyle);
            surveyService.saveSurvey(newSurvey); // 새로 insert 메서드 필요!
        }

        // 완료 후 마이페이지로 이동
        return "redirect:/usr/project/friend";
    }
    
    @RequestMapping("/usr/project/friend")
    public String showRecommendations(HttpServletRequest req, Model model) {
        Rq rq = (Rq) req.getAttribute("rq");
        int memberId = rq.getLoginedMemberId();
        Member member = memberService.getMemberById(memberId);
        Survey survey = surveyService.getSurveyById(memberId);

member.setSurvey(survey);

model.addAttribute("recommend", member);

        List<Member> recommendedFriends = surveyService.recommendFriends(memberId, 5);
        
        for (Member friend : recommendedFriends) {
            Survey friendSurvey = surveyService.getSurveyById(friend.getId());
            friend.setSurvey(friendSurvey);
        }

        model.addAttribute("recommendedFriends", recommendedFriends);

        return "/usr/project/friend";
    }
}