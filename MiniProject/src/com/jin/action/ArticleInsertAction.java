package com.jin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.board.BoardDAO;
import com.jin.board.BoardDTO;

public class ArticleInsertAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDTO article = new BoardDTO();
		article.setTitle(request.getParameter("title"));
		article.setWriter(request.getParameter("writer"));
		article.setContent(request.getParameter("content"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.insertArticle(article);
		
		return "../board/write-pro.jsp";
	}

}
