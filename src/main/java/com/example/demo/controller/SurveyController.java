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

        Survey survey = surveyService.getSurveyById(rq.getLoginedMemberId());
        model.addAttribute("survey", survey);

        return "usr/member/style";
    }

    @RequestMapping("/usr/member/insertStyle")
    public String insertStyle(HttpServletRequest req,
                               @RequestParam(value = "seat", required = false) List<String> seatPreferences,
                               @RequestParam("gender") String mateGender,
                               @RequestParam(value = "style", required = false) List<String> cheeringStyles) {

        Rq rq = (Rq) req.getAttribute("rq");
        int memberId = rq.getLoginedMemberId();

        String seatPreference = seatPreferences != null ? String.join(",", seatPreferences) : "";
        String cheeringStyle = cheeringStyles != null ? String.join(",", cheeringStyles) : "";

        Survey existingSurvey = surveyService.getSurveyById(memberId);

        if (existingSurvey != null) {
            existingSurvey.setSeatPreference(seatPreference);
            existingSurvey.setMateGender(mateGender);
            existingSurvey.setCheeringStyle(cheeringStyle);
            surveyService.updateSurvey(existingSurvey);
        } else {
            Survey newSurvey = new Survey();
            newSurvey.setMemberId(memberId);
            newSurvey.setSeatPreference(seatPreference);
            newSurvey.setMateGender(mateGender);
            newSurvey.setCheeringStyle(cheeringStyle);
            surveyService.saveSurvey(newSurvey);
        }

        // 스타일 입력 후, 친구 추천 화면으로 리다이렉트
        return "/usr/project/friend";
    }

    @RequestMapping("/usr/project/friend")
    @ResponseBody
    public String showRecommendations(HttpServletRequest req, Model model) {
        Rq rq = (Rq) req.getAttribute("rq");

        int memberId = rq.getLoginedMemberId();
        Member member = memberService.getMemberById(memberId);

        // 멤버 정보 확인
        if (member == null) {
 
            return Ut.jsHistoryBack("F-2", "회원 정보를 찾을 수 없습니다.");
        }

        // 스타일(설문) 등록 여부 확인
        Survey survey = surveyService.getSurveyById(memberId);
        if (survey == null) {
            return Ut.jsReplace("F-2", "먼저 스타일 설문을 등록해주세요.","../member/modifyStyle");
        }

        // 정상 처리
        member.setSurvey(survey);
        model.addAttribute("recommend", member);

        List<Member> recommendedFriends = surveyService.recommendFriends(memberId, 5);
        for (Member friend : recommendedFriends) {
            Survey friendSurvey = surveyService.getSurveyById(friend.getId());
            friend.setSurvey(friendSurvey);
        }
        model.addAttribute("recommendedFriends", recommendedFriends);

        return "<script>location.replace('/usr/project/friend/view');</script>"; // 실제 뷰로 이동
    }
    
    @RequestMapping("/usr/project/friend/view")
    public String showFriendView(HttpServletRequest req, Model model) {
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

        return "usr/project/friend"; // JSP 뷰 이동!
    }
}