package com.jin.uri;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInsertAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String echo = request.getParameter("title") + "  " + request.getParameter("writer") + "  " +request.getParameter("content");
		System.out.println(echo);
		
		return "../board/write-pro.jsp";
	}

}
