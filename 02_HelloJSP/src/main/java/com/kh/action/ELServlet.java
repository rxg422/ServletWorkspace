package com.kh.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.action.model.vo.Person;

@WebServlet("/el/el.do")
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ELServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 	데이터를 저장할 수 있는 Servlet
		 	1. ServletContext(application scope)
		 		- 어플리케이션 당 1개만 존재
		 		- 이 영역에 데이터를 추가하면 컨텍스트 전역에서 공유하면서 사용가능
		 		- 서버가 멈추기 전까지 계속 데이터가 유지됨
		 	2. HttpSession(session scope)
		 		- 접속한 사용자 별로 데이터를 저장할 수 있는 객체
		 		- 개발자가 직겁 HttpSession의 유지시간을 설정가능
		 		- 이 영역에 데이터를 추가하면 Context 전역에서 공유하면서 사용가능
		 	3. HttpServletRequest(request scope)
		 		- 클라이언트의 요청별로 매번 새롭게 생성되는 객체
		 		- 이 영역에 데이터를 추가하면 현재 요청을 받은 서블릿과 포워딩받는 서블릿/jsp에서 데이터를 사용가능
		 		- 값이 한번 담기면 재요청이 이루어지는 순간 이전 request는 소멸
		 	4. PageContext(page scope)
		 		- jsp에서만 사용가능한 영역, 하나의 jsp에서만 공유할 데이터를 선언하는 영역
		*/
		// 1. requestScope 데이터 저장
		request.setAttribute("classRoom", "G강의장");
		request.setAttribute("student", new Person("김태환", 25, "남자"));
		
		// 2. sessionScope 데이터 저장
		HttpSession session = request.getSession();
		session.setAttribute("academy", "KH정보교육원");
		session.setAttribute("teacher", new Person("민경민", 28, "남자"));
		session.setAttribute("scope", "session");
		
		// 3. applicationScope 데이터 저정
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		request.getRequestDispatcher("/el/01_el.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
