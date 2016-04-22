package com.jin.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
		List<BoardDTO> board = null;
		BoardDTO article = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			String sql = "SELECT NUM, WRITER, TITLE, CONTENT, DATE_FORMAT(NOW(), '%y.%m.%d') 'DATE', HIT FROM BOARD ORDER BY NUM DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				board = new ArrayList<>();

				do {
					article = new BoardDTO();

					article.setNum(rs.getString("num"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setDate(rs.getString("date"));
					article.setHit(rs.getString("hit"));

					board.add(article);

				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return board;
	}

	public BoardDTO readArticle(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO article = null;

		try {
			conn = getConnection();

			String sql = "SELECT DATE, WRITER, TITLE, CONTENT FROM BOARD WHERE NUM = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				article = new BoardDTO();
				
				article.setNum(num);
				article.setDate(rs.getString("DATE"));
				article.setWriter(rs.getString("WRITER"));
				article.setTitle(rs.getString("TITLE"));
				article.setContent(rs.getString("CONTENT"));

				return article;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return null;
	}

	public void insertArticle(BoardDTO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			String sql = "INSERT INTO BOARD(WRITER, TITLE, CONTENT) VALUES(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}

	public void updateArticle(BoardDTO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			
			String sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ?, DATE = NOW() WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3, article.getNum());
			pstmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
			if (conn != null) try{ conn.close(); }catch(SQLException ex) {}
		}
	}

	public void deleteArticle(String num) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
			conn = getConnection();
			
			String sql = "DELETE FROM BOARD WHERE NUM = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.executeUpdate();
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
            if (conn != null) try{ conn.close(); }catch(SQLException ex) {}
        }
    }

}
