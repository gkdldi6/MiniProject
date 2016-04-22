package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.board.BoardDAO;
import com.jin.board.BoardDTO;

public class ArticleReadAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String num = request.getParameter("num");
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO article = boardDAO.readArticle(num);
		
		request.setAttribute("article", article);
		
		return "../board/article.jsp";
	}

}
