package com.jin.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import work.crypt.BCrypt;
import work.crypt.SHA256;


public class UserDAO {
	private static UserDAO instance = new UserDAO();
	private final int SUCCESS = 1, FAILURE = 0, ERROR = -1;

	
	private UserDAO() {}
	
	public static UserDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		 Context initCtx = new InitialContext();
	     Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource)envCtx.lookup("jdbc/matchmaker");
	     
	     return ds.getConnection();
	}

	public void insertUser(UserDTO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		SHA256 sha = SHA256.getInstance();
		try {
			conn = getConnection();
			
			String orgPw = user.getPw();
	        String shaPw = sha.getSha256(orgPw.getBytes());
	    	String bcPw = BCrypt.hashpw(shaPw, BCrypt.gensalt());
			
			String sql = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, bcPw);
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAge());
			pstmt.setString(5, user.getEmail());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	}

	public int login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		SHA256 sha = SHA256.getInstance();
		try {
			conn = getConnection();
			
	        String shaPw = sha.getSha256(pw.getBytes());
			
			String sql = "SELECT PW FROM USER WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbPw = rs.getString("pw");
				
				if(BCrypt.checkpw(shaPw, dbPw)) {
					return SUCCESS;
				} else {
					return FAILURE;
				}
			}
			else {
				return FAILURE;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return ERROR;
	}

	public int confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT 1 FROM USER WHERE ID = ? LIMIT 1"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(conn != null) try { conn.close(); } catch (SQLException e) {} 
		}
		return -1;
	}

	public int checkUser(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT PW FROM USER WHERE ID = ? LIMIT 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			String dbpw = rs.getString("pw");
			
			SHA256 sha = SHA256.getInstance();
			String shaPw = sha.getSha256(pw.getBytes());
			
			if(BCrypt.checkpw(shaPw, dbpw)) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(conn != null) try { conn.close(); } catch (SQLException e) {} 
		}
		return -1;
	} 

	public int updateUser(UserDTO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		SHA256 sha = SHA256.getInstance();
		
		try {
			conn = getConnection();
			
			String pw = user.getPw();
			String shaPw = sha.getSha256(pw.getBytes());
			String bcPw = BCrypt.hashpw(shaPw, BCrypt.gensalt());
			
			String sql = "UPDATE USER SET PW = ?, NAME = ?, AGE = ?, EMAIL = ? WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bcPw);
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getAge());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getId());
			
			pstmt.executeUpdate();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return 0;
	}

	public int deleteUser(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		SHA256 sha = SHA256.getInstance();
		
		try {
			conn = getConnection();
			
			String sql = "SELECT PW FROM USER WHERE ID = ? LIMIT 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			String dbpw = rs.getString("pw");
			String shaPw = sha.getSha256(pw.getBytes());
			
			if(BCrypt.checkpw(shaPw, dbpw)) {
				sql = "DELETE FROM USER WHERE ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(conn != null) try { conn.close(); } catch (SQLException e) {} 
		}
		return -1;
	} 
	
}
