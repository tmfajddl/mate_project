package com.example.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

	private int id;
	private LocalDateTime regDate;
	private LocalDateTime updateDate;
	private String loginId;
	private String loginPw;
	private String name;
	private String nickname;
	private String cellphoneNum;
	private String email;
	private String team;
	private String gender;
	private String introduce;
	private String profileImg;
	private boolean delStatus;
	private LocalDateTime delDate;
	
	private Survey survey;
	
}