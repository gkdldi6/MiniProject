package com.jin.uri;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInsertAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("result", "삽입");
		return "/main.jsp";
	}

}
