package com.kh.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Board;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Board> list = new ArrayList<>();
		list.add(new Board("kh게시판 1번글", "admin", "2024-06-05", " "));
		list.add(new Board("kh게시판 2번글", "admin", "2024-06-05", " "));
		list.add(new Board("kh게시판 1번글", "admin", "2024-06-05", " "));
		list.add(new Board("kh게시판 4번글", "admin", "2024-06-05", " "));
		list.add(new Board("kh게시판 5번글", "admin", "2024-06-05", " "));
		
		request.getRequestDispatcher("/board/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
