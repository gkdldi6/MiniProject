package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.user.UserDAO;

public class UserConfirmAction implements Action{

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		
		UserDAO userDAO = UserDAO.getInstance();
		int result = userDAO.confirmId(id);
		
		request.setAttribute("result", result);

		return "user/confirmid-pro.jsp";
	}

}
