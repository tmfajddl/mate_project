package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Article;
import com.example.demo.vo.Board;

@Mapper
public interface BoardRepository {

	public Board getBoardById(int id);
	
	public List<Article> getArticles(int boardId, int start, int end);
	
	public Board getBoardByCode(String code);

	public List<Article> getTotalArticles(int boardId);

}