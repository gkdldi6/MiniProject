package com.jin.user;

import java.sql.Connection;

public class UserDAO implements UserDAOInter {

	@Override
	public UserDTO getInstance() {
		return null;
	}

	@Override
	public Connection getConnection() {
		return null;
	}

	@Override
	public void insertUser(UserDTO user) {
		
	}

	@Override
	public int userCheck(String id, String pw) {
		return 0;
	}

	@Override
	public int confirmId(String id) {
		return 0;
	}

	@Override
	public UserDTO getUser(String id, String pw) {
		return null;
	}

	@Override
	public int updateUser(UserDTO user) {
		return 0;
	}

	@Override
	public int deleteUser(String id, String pw) {
		return 0;
	}
	
}
