package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Mapper
public interface ArticleRepository {

	public int writeArticle(int memberId, String title, String body, String boardId);

	public void deleteArticle(int id);

	public void modifyArticle(int id, String title, String body);

	public int getLastInsertId();

	public Article getArticleById(int id);

	public List<Article> getArticles();

	public Article getForPrintArticle(int loginedMemberId);

	public List<Article> getForPrintArticles(int boardId, int limitFrom, int limitTake);

	public int getArticleCount(int boardId);

	public int getKeywordArticleCount(int search, String keyword);

	public List<Article> getForKeywordPrintArticles(int search, String keyword, int limitFrom, int limitTake);

	public void updateView(int id);

	public ResultData increaseLikeCount(int id);

	public int getArticleLikeCount(int id);
	
}