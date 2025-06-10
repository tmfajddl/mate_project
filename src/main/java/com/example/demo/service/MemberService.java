package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {
	
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private MailService mailService;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public ResultData notifyTempLoginPwByEmail(Member actor) {
		String title = "[" + siteName + "] 임시 패스워드 발송";
		String tempPassword = Ut.getTempPassword(6);
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a href=\"" + siteMainUri + "/usr/member/login\" target=\"_blank\">로그인 하러가기</a>";

		ResultData sendResultData = mailService.send(actor.getEmail(), title, body);

		if (sendResultData.isFail()) {
			return sendResultData;
		}

		setTempPassword(actor, tempPassword);

		return ResultData.from("S-1", "계정의 이메일주소로 임시 패스워드가 발송되었습니다.");
	}

	private void setTempPassword(Member actor, String tempPassword) {
		memberRepository.modifyMember(actor.getId(), Ut.sha256(tempPassword), null, null, null, null, null);
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email, String gender, String team) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}
		
		loginPw = Ut.sha256(loginPw);

		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email, gender, team);

		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입 성공", "가입 성공 id", id);
	}

	public Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);

	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
	public ResultData userCanModify(int loginedMemberId, Member member) {

		if (member.getId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 회원에 대한 수정 권한 없음", member.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 회원 수정 가능", member.getId()));
	}

	public ResultData userCanDelete(int loginedMemberId, Member member) {
		if (member.getId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 회원에 대한 삭제 권한 없음", member.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 회원 삭제 가능", member.getId()));
	}

	public void modifyMember(int loginedId, String loginPw,String nickname, String cellphoneNum, String email, String introduce, String profileImg) {
		memberRepository.modifyMember(loginedId, loginPw, nickname, cellphoneNum, email, introduce, profileImg);
	}

	public void deleteMember(int id) {
		memberRepository.deleteMember(id);
	}
	
	public ResultData modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email, String introduce) {
		loginPw = Ut.sha256(loginPw);

		memberRepository.modify(loginedMemberId, loginPw, name, nickname, cellphoneNum, email, introduce);

		return ResultData.from("S-1", "회원정보 수정 완료");
	}

	public ResultData modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum,
			String email, String introduce) {
		memberRepository.modifyWithoutPw(loginedMemberId, name, nickname, cellphoneNum, email, introduce);

		return ResultData.from("S-1", "회원정보 수정 완료");
	}


}