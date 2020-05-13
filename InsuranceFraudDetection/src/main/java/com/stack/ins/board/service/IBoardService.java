package com.stack.ins.board.service;

import java.util.List;

import com.stack.ins.board.model.Board;
import com.stack.ins.board.model.BoardFile;

public interface IBoardService {
	void insertArticle(Board boardId);
	void insertArticle(Board boardId, BoardFile file);
	
	List<Board> selectArticleList(int page);
	List<Board> selectArticleListByCategory(int categoryId, int page);
	List<Board> selectArticleListByCategory(int categoryId);
	
	Board selectArticle(int boardId);
	
	BoardFile getFile(int fileId);
	
	void replyArticle(Board board);
	void replyArticle(Board board, BoardFile file);

	String getPassword(int boardId);
	
	void updateArticle(Board board);
	void updateArticle(Board board, BoardFile file);
	
	Board selectDeleteArticle(int boardId);
	void deleteArticle(int boardId, int replyNumber);
	
	int selectTotalArticleCount();
	int selectTotalArticleCountByCategoryId(int categoryId);
	
	List<Board> searchListByContentKeyword(String keyword);
}
