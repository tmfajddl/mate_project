package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {
	@Autowired
	private Rq rq;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogin(HttpSession session, HttpServletRequest req) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (!rq.isLogined()) {
			return Ut.jsReplace("F-A", "로그인상태가 아닙니다", "../home/main");
		}

		session.removeAttribute("loginedMemberId");

		return Ut.jsReplace("S-1", "로그아웃 성공", "../home/main");
	}
	
	@RequestMapping("/usr/member/login")
	public String login(Model model) {
		
		return "usr/member/login";	
	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpSession session, HttpServletRequest req, Model model, String loginId, String loginPw) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsReplace("F-A", "로그인 되어있습니다", "../home/main");
		}

		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력하세요");
		}

		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력하세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", "아이디가 존재하지 않습니다.");
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", "비밀번호가 틀립니다");
		}
		
		session.setAttribute("loginedMemberId", member.getId());


		return Ut.jsReplace("S-1", member.getNickname()+"님 환영합니다.", "../article/list");
	}
	
	@RequestMapping("/usr/member/join")
	public String join(Model model) {
		
		return "usr/member/join";	
	}

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpSession session, HttpServletRequest req, Model model, String loginId, String loginPw, String loginPw2, String name, String nickname,
			String cellphoneNum, String email) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "로그인 되어있습니다");
		}

		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력하세요");
		}

		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력하세요");
		}
		
		if (Ut.isEmptyOrNull(loginPw2)) {
			return Ut.jsHistoryBack("F-7", "비밀번호 확인란을 입력하세요");
		}
		
		if (!loginPw.equals(loginPw2)) {
			return Ut.jsHistoryBack("F-8", "비밀번호가 일치하지 않습니다.");
		}
		
		if (Ut.isEmptyOrNull(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력하세요");

		}
		if (Ut.isEmptyOrNull(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력하세요");

		}
		if (Ut.isEmptyOrNull(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력하세요");

		}
		if (Ut.isEmptyOrNull(email)) {
			return Ut.jsHistoryBack("F-6", "E-mail을 입력하세요");

		}

		ResultData doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (doJoinRd.isFail()) {
			return Ut.jsReplace(doJoinRd.getResultCode(), doJoinRd.getMsg(), "../home/main");
		}

		Member member = memberService.getMemberById((int) doJoinRd.getData1());

		return Ut.jsReplace("S-1", member.getNickname()+"님 환영합니다.", "../home/main");
	}

}