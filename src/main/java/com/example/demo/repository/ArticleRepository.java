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

	public void increaseLikeCount(int id);

	public void increaseDislikeCount(int id);

	public int getLikeCount(int id);

	public void decreaseLikeCount(int id);

	public int getDisikeCount(int id);

	public void increaseGoodReactionPoint(int relId);

	public void increaseBadReactionPoint(int relId);

	public void decreaseGoodReactionPoint(int relId);
	
	public void decreaseBadReactionPoint(int relId);
	
	
}