package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArticleUpdateAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String result = "test";
		
		request.setAttribute("result", result);
		
		return "../board/update-pro.jsp";
	}

}
