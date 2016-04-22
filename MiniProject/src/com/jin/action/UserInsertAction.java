package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.user.UserDAO;
import com.jin.user.UserDTO;

public class UserInsertAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		UserDTO user = new UserDTO();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		user.setAge(request.getParameter("age"));
		user.setEmail(request.getParameter("email"));
		
		
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.insertUser(user);
		
		return "main.jsp";
	}
}
