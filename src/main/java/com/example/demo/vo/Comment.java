package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Comment {

	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private int articleId;
	private int like;
	private String body;

	private String extra__writer;
	private boolean userCanModify;
	private boolean userCanDelete;
}