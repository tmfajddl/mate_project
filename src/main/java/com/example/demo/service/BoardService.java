package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BoardRepository;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	public Board getBoardById(int boardId) {

		return boardRepository.getBoardById(boardId);
	}
	
	public List<Article> getArticles(int boardId, int start, int end) {
		return boardRepository.getArticles(boardId, start, end);
	}
	
	public Board getBoardByCode(String code) {
		return boardRepository.getBoardByCode(code);
	}
	
	public List<Article> getTotalArticles(int boardId) {

		return boardRepository.getTotalArticles(boardId);
	}


}