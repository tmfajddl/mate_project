package com.example.demo.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrMemberController {

	@Autowired
	private Rq rq;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogin(HttpServletRequest req) {

		Rq rq = (Rq) req.getAttribute("rq");

		rq.logout();

		return Ut.jsReplaceNoAlert("S-1", "로그아웃 성공", "/");
	}

	@RequestMapping("/usr/member/login")
	public String showLogin(HttpServletRequest req) {
		return "/usr/member/login";
	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw,
			@RequestParam(defaultValue = "/") String afterLoginUri) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력하세요");
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력하세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s는(은) 없는 아이디입니다.", loginId));
		}

		if (member.getLoginPw().equals(Ut.sha256(loginPw)) == false) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다."));
		}

		rq.login(member);

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), afterLoginUri);
	}

	@RequestMapping("/usr/member/join")
	public String showJoin(HttpServletRequest req) {
		return "/usr/member/join";
	}

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String loginPw2, String name, String nickname,
	                     String cellphoneNum, String email, String gender, String team) {

	    // 비밀번호 일치 확인
	    if (!loginPw.equals(loginPw2)) {
	        return Ut.jsHistoryBack("F-9", "비밀번호가 일치하지 않습니다.");
	    }

	    // 필수 입력값 확인
	    if (Ut.isEmptyOrNull(loginId)) {
	        return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(loginPw)) {
	        return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(name)) {
	        return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(nickname)) {
	        return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(cellphoneNum)) {
	        return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(email)) {
	        return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(gender)) {
	        return Ut.jsHistoryBack("F-7", "성별을 입력해주세요");
	    }
	    if (Ut.isEmptyOrNull(team)) {
	        return Ut.jsHistoryBack("F-8", "응원 팀을 선택해주세요");
	    }

	    if (loginId.length() < 6) {
	        return Ut.jsHistoryBack("F-10", "아이디는 6자 이상이어야 합니다.");
	    }

	    if (loginPw.length() < 8) {
	        return Ut.jsHistoryBack("F-11", "비밀번호는 8자 이상이어야 합니다.");
	    }

	    if (!loginPw.matches(".*[!@#$%^&*(),.?\":{}|<>].*")) {
	        return Ut.jsHistoryBack("F-12", "비밀번호에 특수문자를 포함해야 합니다.");
	    }
	    

	    // 회원가입 시도
	    ResultData joinRd = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email, gender, team);

	    if (joinRd.isFail()) {
	        return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
	    }

	    Member member = memberService.getMemberById((int) joinRd.getData1());

	    return Ut.jsReplaceNoAlert(joinRd.getResultCode(), joinRd.getMsg(), "../member/login");
	}
	
	@RequestMapping("/usr/member/modify")
	public String showModify(HttpServletRequest req, Model model) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		if (rq.getLoginedMemberId() == 0) {
			return Ut.jsReplace("F-1", Ut.f("로그인 후 이용바랍니다"),"../member/login");
		}

		Member member = memberService.getMemberById(rq.getLoginedMemberId());

		if (member == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 회원은 없습니다", rq.getLoginedMemberId()));
		}

		model.addAttribute("member", member);

		return "/usr/member/modify";
	}

	// 로그인 체크 -> 유무 체크 -> 권한체크
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req,
	                       String loginPw,
	                       String loginPw2,
	                       String nickname,
	                       String cellphoneNum,
	                       String email,
	                       String introduce,
	                       MultipartFile profileImgFile) {

	    Rq rq = (Rq) req.getAttribute("rq");
	    int loginedId = rq.getLoginedMemberId();

	    Member member = memberService.getMemberById(loginedId);

	    if (member == null) {
	        return Ut.jsHistoryBack("F-1", Ut.f("%d번 회원은 없습니다", loginedId));
	    }

	    // 기존 비밀번호 유지용
	    String encodedPw = member.getLoginPw();

	    // 새 비밀번호를 입력한 경우에만 변경
	    if (!Ut.isEmpty(loginPw) || !Ut.isEmpty(loginPw2)) {
	        if (!loginPw.equals(loginPw2)) {
	            return Ut.jsHistoryBack("F-1", "비밀번호가 일치하지 않습니다");
	        }
	        if (!Ut.isEmpty(loginPw)) {
	            encodedPw = Ut.sha256(loginPw);
	        }
	    }

	    ResultData userCanModifyRd = memberService.userCanModify(loginedId, member);
	    if (userCanModifyRd.isFail()) {
	        return Ut.jsHistoryBack(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
	    }

	    String profileImg = member.getProfileImg(); // 기존 이미지 경로 유지용

	    // 파일이 비어있지 않으면 저장 처리
	    if (profileImgFile != null && !profileImgFile.isEmpty()) {
	        try {
	            // 업로드 폴더(서버 기준 경로, 절대경로로 바꾸세요)
	            String uploadDir = "C:\\myapp\\uploads\\profile\\";

	            // 파일 이름 중복 방지 UUID 활용
	            String newFilename = java.util.UUID.randomUUID().toString() + "_" + profileImgFile.getOriginalFilename();

	            Path filePath = Paths.get(uploadDir + newFilename);

	            // 디렉토리 없으면 생성
	            Files.createDirectories(filePath.getParent());

	            // 파일 저장
	            profileImgFile.transferTo(filePath.toFile());

	            // 저장된 경로를 DB에 저장할 경로로 세팅 (웹에서 접근 가능한 경로로 변경 필요)
	            profileImg = "/upload/profile/" + newFilename;

	        } catch (Exception e) {
	            e.printStackTrace();
	            return Ut.jsHistoryBack("F-1", "이미지 업로드 실패");
	        }
	    }

	    // 회원 정보 수정 시 반드시 encodedPw 사용 (null이나 빈값 방지)
	    memberService.modifyMember(loginedId, encodedPw, nickname, cellphoneNum, email, introduce, profileImg);

	    return Ut.jsReplaceNoAlert(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(), "../home/main");
	}
	
	@RequestMapping("/usr/member/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Member member = memberService.getMemberById(id);

		if (member == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 회원은 없습니다", id));
		}

		ResultData userCanDeleteRd = memberService.userCanDelete(rq.getLoginedMemberId(), member);

		if (userCanDeleteRd.isFail()) {
			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
		}

		if (userCanDeleteRd.isSuccess()) {
			memberService.deleteMember(id);
			rq.logout();
		}

		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(), "../home/main");
	}
	
	@RequestMapping("/usr/member/myPage")
	public String showmyPage() {
		return "usr/member/myPage";
	}

	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {
		return "usr/member/checkPw";
	}

	@RequestMapping("/usr/member/doCheckPw")
	@ResponseBody
	public String doCheckPw(String loginPw) {
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-1", "비밀번호를 입력해주세요.");
		}

		if (rq.getLoginedMember().getLoginPw().equals(Ut.sha256(loginPw)) == false) {
			return Ut.jsHistoryBack("F-2", "비밀번호가 틀립니다.");
		}

		return Ut.jsReplaceNoAlert("S-1", Ut.f("비밀번호 확인 성공"), "modify");
	}
	
	@RequestMapping("/usr/member/style")
	public String showstyle() {
		return "usr/member/style";
	}
	
	@GetMapping("/usr/member/checkLoginId")
	@ResponseBody
	public String checkLoginId(@RequestParam String loginId) {
	    Member member = memberService.getMemberByLoginId(loginId);
	    return member == null ? "available" : "duplicated";
	}
	@RequestMapping("/usr/member/findLoginId")
	public String showFindLoginId() {

		return "usr/member/findLoginId";
	}
	
	@RequestMapping("/usr/member/doFindLoginId")
	@ResponseBody
	public String doFindLoginId(@RequestParam(defaultValue = "/") String afterFindLoginIdUri, String name,
			String email) {

		Member member = memberService.getMemberByNameAndEmail(name, email);

		if (member == null) {
			return Ut.jsHistoryBack("F-1", "너는 없는 사람이야");
		}

		return Ut.jsReplace("S-1", Ut.f("너의 아이디는 [ %s ] 야", member.getLoginId()), afterFindLoginIdUri);
	}

	@RequestMapping("/usr/member/findLoginPw")
	public String showFindLoginPw() {

		return "usr/member/findLoginPw";
	}

	@RequestMapping("/usr/member/doFindLoginPw")
	@ResponseBody
	public String doFindLoginPw(@RequestParam(defaultValue = "/") String afterFindLoginPwUri, String loginId,
			String email) {

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-1", "너는 없는 사람이야");
		}

		if (member.getEmail().equals(email) == false) {
			return Ut.jsHistoryBack("F-2", "일치하는 이메일이 없는데?");
		}

		ResultData notifyTempLoginPwByEmailRd = memberService.notifyTempLoginPwByEmail(member);

		return Ut.jsReplace(notifyTempLoginPwByEmailRd.getResultCode(), notifyTempLoginPwByEmailRd.getMsg(),
				afterFindLoginPwUri);
	}
	
	@RequestMapping("/usr/member/getLoginIdDup")
	@ResponseBody
	public ResultData getLoginIdDup(String loginId) {

		if (Ut.isEmpty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요");
		}

		Member existsMember = memberService.getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-2", "해당 아이디는 이미 사용중이야", "loginId", loginId);
		}

		return ResultData.from("S-1", "사용 가능!", "loginId", loginId);
	}
	
	@RequestMapping("/usr/member/checkNickname")
	@ResponseBody
	public String checkNickname(@RequestParam String nickname) {
		 Member member = memberService.getMemberByNickname(nickname);
		    return member == null ? "available" : "duplicated";
	}
}

