package com.jin.board;

import java.sql.Connection;
import java.util.List;

public interface BoardDAOInter {
	BoardDTO getInstance();
	Connection getConnection();
	List<BoardDTO> getBoard();
	void insertArticle(BoardDTO board);
	int updateBoard(BoardDTO board);
	int deleteBoard(int articleNum, String pw);
}
