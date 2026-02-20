package com.kh.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestPerson2Servlet
 */
@WebServlet("/testPerson2.do")
public class TestPerson2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public TestPerson2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST 방식 요청시 클라이언트가 전달하는 데이터는 url의 body 내부에 존재하는데, 이곳의 인코딩 환경은 ISO-8859-1이기 때문에 UTF-8로 변경해야 한다.
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 입력한 값 변수에 저장
		String recommendation = "";
		String color = request.getParameter("color");
		
		switch(color) {
		case "빨강" -> recommendation = "짬뽕";
		case "노랑" -> recommendation = "카레";
		case "초록" -> recommendation = "샐러드";
		case "파랑" -> recommendation = "파워에이드";
		}
		
		// was상에서 업무 로직에 의해 생성한 데이터를 request에 저장하는 방법
		request.setAttribute("recommendation", recommendation);
		
		// 응답데이터 생성을 jsp에게 위임(forward)
		// getRequestDispatcher(요청처리를 위임할 jsp나 servlet의 매핑경로 제시)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/servlet/testPersonResponse.jsp");
		dispatcher.forward(request, response);
	}

}
