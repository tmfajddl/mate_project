package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입 성공", "가입 성공 id", id);
	}

	private Member getMemberByNameAndEmail(String name, String email) {
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

	public void modifyMember(int loginedId, String loginPw,String nickname, String cellphoneNum, String email) {
		memberRepository.modifyMember(loginedId, loginPw, nickname, cellphoneNum, email);
	}

	public void deleteMember(int id) {
		memberRepository.deleteMember(id);
	}

}