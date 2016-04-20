package com.jin.board;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jin.user.UserDAO;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	

	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/matchmaker");

		return ds.getConnection();
	}

	public List<BoardDTO> getBoard() {
		
		
		
		return null;
	}

	public void insertArticle(BoardDTO article) {
		
	}

	public int updateArticle(BoardDTO article) {
		return 0;
	}

	public int deleteArticle(int articleNum, String pw) {
		return 0;
	}

}
