package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.Article;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Controller
public class UsrArticleController {
	List<Article> articleList = new ArrayList<>();
	int lastId = 0;
	
	UsrArticleController(){
		for(int i = 0; i < 10; i++) {
			int id = ++lastId;
			String title = "제목"+ (int) Math.ceil(Math.random()*10);
			String body = "내용"+ (int) Math.ceil(Math.random()*10);
			Article article = new Article(id, title, body);
			 articleList.add(article);
		}
	}

	@RequestMapping("/usr/article/doAdd")
	@ResponseBody
	public String doAdd(String title, String body) {
		int id = ++lastId;
 
		Article article = new Article(id, title, body);
		 articleList.add(article);

		return id + "번 게시글이 등록되었습니다.";
	}
	
	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public List<Article> getArticles() {

		return articleList;
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		for(Article article : articleList) {
			if(article.getId()==id) {
				articleList.remove(article);
				return id + "번 글이 삭제 되었습니다.";
			}
		}

		return id + "번 글은 존재하지 않습니다.";
	}
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id) {

		for(Article article : articleList) {
			if(article.getId()==id) {
				String title = "cdsfsd";
				String body = "sfdsf";
				article.setTitle(title);
				article.setBody(body);
				return id + "번 글이 수정 되었습니다.\n" + "id :" + article.getId() + " title :" + article.getTitle() + " body :" + article.getBody();
			}
		}

		return id + "번 글은 존재하지 않습니다.";

	}
}
