package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.board.BoardDAO;
import com.jin.board.BoardDTO;

public class ArticleUpdateAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDTO article = new BoardDTO();
		article.setNum(request.getParameter("num"));
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.updateArticle(article);
		
		return "board/update-pro.jsp";
	}

}
