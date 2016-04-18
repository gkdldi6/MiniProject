package com.jin.user;

import java.sql.Connection;

public interface UserDAOInter {
	UserDTO getInstance();
	Connection getConnection();
	void insertUser(UserDTO user);
	int userCheck(String id, String pw);
	int confirmId(String id);
	UserDTO getUser(String id, String pw);
	int updateUser(UserDTO user);
	int deleteUser(String id, String pw);
}
