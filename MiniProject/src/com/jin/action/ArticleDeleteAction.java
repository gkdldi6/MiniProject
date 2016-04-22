package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.board.BoardDAO;

public class ArticleDeleteAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String num = request.getParameter("num");
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.deleteArticle(num);
		
		return "board/delete-pro.jsp";
	}

}
