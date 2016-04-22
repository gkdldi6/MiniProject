package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArticleWriteFormAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		request.setAttribute("writer", id);
		
		return "board/write.jsp";
	}

}
