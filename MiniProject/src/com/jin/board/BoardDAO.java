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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> getBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertArticle(BoardDTO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateBoard(BoardDTO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int articleNum, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}

}
