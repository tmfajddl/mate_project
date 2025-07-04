package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Member;

@Mapper
public interface MemberRepository {

	public int doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email, String gender, String team);

	public Member getMemberById(int id);

	public int getLastInsertId();

	public Member getMemberByLoginId(String loginId);

	public Member getMemberByNameAndEmail(String name, String email);

	public void modifyMember(int loginedId, String loginPw,String nickname, String cellphoneNum, String email, String introduce,String profileImg);

	public void deleteMember(int id);
	
	public void modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email, String introduce);

	public void modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum, String email, String introduce);

	public Member getMemberByNickname(String nickname);

}