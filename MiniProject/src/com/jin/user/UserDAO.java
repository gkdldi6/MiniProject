package com.jin.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class UserDAO {
	private static UserDAO instance = new UserDAO();
	public static final int SUCCESS = 1, FAILURE = 0, ERROR = -1;

	
	private UserDAO() {}
	
	public static UserDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		 Context initCtx = new InitialContext();
	     Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource)envCtx.lookup("jdbc/matchmaker");
	     
	     System.out.println("DB가 연결 되었습니다.");
	     return ds.getConnection();
	}

	public int insertUser(UserDTO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAge());
			pstmt.setString(5, user.getEmail());
			
			pstmt.executeUpdate();
			
			return SUCCESS;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return FAILURE;
	}

	public int login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT PW FROM USER WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String realPw = rs.getString("pw");
				
				if(pw.equals(realPw)) {
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
		}
		return ERROR;
	}

	public int confirmId(String id) {
		
		return 0;
	}

	public UserDTO getUser(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateUser(UserDTO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteUser(String id, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
