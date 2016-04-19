package com.jin.uri;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDeleteAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("result", "삭제");
		return "/main.jsp";
	}

}
