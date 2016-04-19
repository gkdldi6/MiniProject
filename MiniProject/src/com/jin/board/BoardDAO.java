package com.jin.board;

import java.sql.Connection;
import java.util.List;

public class BoardDAO implements BoardDAOInter {

	@Override
	public BoardDTO getInstance() {

		return null;
	}

	@Override
	public Connection getConnection() {
		return null;
	}

	@Override
	public List<BoardDTO> getBoard() {
		return null;
	}

	@Override
	public void insertArticle(BoardDTO board) {
		
	}

	@Override
	public int updateBoard(BoardDTO board) {
		return 0;
	}

	@Override
	public int deleteBoard(int articleNum, String pw) {
		return 0;
	}

}
