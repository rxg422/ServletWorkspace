package com.kh.board;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/board/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Map<String, Object>> list = (List)session.getAttribute("list");
		
		Map<String, Object> board = new HashMap<>();
		board.put("bno", list.size());
		board.put("title", request.getParameter("title"));
		board.put("writer", request.getParameter("writer"));
		board.put("createDate", new Date());
		board.put("content", request.getParameter("content"));
		
		list.add(board);
		
		request.setAttribute("list", list);
		doGet(request, response);
	}

}
