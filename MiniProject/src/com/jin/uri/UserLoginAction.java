package com.jin.uri;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.user.UserDAO;

public class UserLoginAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		UserDAO userDAO = UserDAO.getInstance();
		int result = userDAO.login(id, pw);
		
		request.setAttribute("result", result);
		
		return "/login-form.jsp";
	}
}
