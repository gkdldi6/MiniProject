package com.jin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.board.BoardDAO;
import com.jin.board.BoardDTO;

public class BoardReadAction implements Action {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> board = boardDAO.getBoard();
		
		request.setAttribute("board", board);
		
		return "/board/board-main.jsp";
	}

}
