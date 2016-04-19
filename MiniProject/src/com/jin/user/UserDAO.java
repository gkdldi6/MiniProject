package com.jin.user;

import java.sql.Connection;

public class UserDAO implements UserDAOInter {
	private static UserDAO instance = new UserDAO();
	
	
	@Override
	public UserDTO getInstance() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUser(UserDTO user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int userCheck(String id, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmId(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO getUser(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUser(UserDTO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(String id, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
