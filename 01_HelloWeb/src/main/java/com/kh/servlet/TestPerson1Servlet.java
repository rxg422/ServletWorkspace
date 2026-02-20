package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestPerson1Servlet
 */
//@WebServlet("/TestPerson1Servlet")
@WebServlet("/testPerson1.do")
public class TestPerson1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestPerson1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /*
    	Servlet
    		- 자바를 사용하여 동적인 웹페이지를 만들기 위해 필요한 기술
    		- 사용자의 요청을 받아 처리하고, 올바른 응답페이지를 사용자에게 응답하는 역할을 하는 자바클래스(Controller)
    		- 웹에서 동적인 페이지를 자바를 통해 구현할 수 있도록 도와주는 서버측 프로그램
    		
    	Servlet 생명주기
    		- 하나의 객체만 생성되어 처리 (싱글턴 패턴)
    		1. Servlet 객체 생성
    		2. init 호출
    		3. HttpServlet의 service() 호출(매 클라이언트 요청마다)
    		4. 전송방식에 따라 doGet() 또는 doPost() 호출
    		5. destroy() 호출
    		
    	GET/POST
    		- GET : 서비스 호출 전후로 DB의 상태가 바뀌지 않는 서비스(SELECT)
    		- POST : 서비스 호출 결과로 DB의 상태가 바뀌는 서비스(DML), 로그인 서비스와 같은 url의 노출을 막아야 할 때
    */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
			HttpServletRequest
				- 서비스 요청시 사용자가 전송한 입력값, 요청전송방식, url등 요청정보와 관련된 데이터가 담긴 객체
			HttpServletResponse
				- 응답정보를 담을 객체
		*/
		
		// 1. HttpServletRequest 메서드
		// 사용자 입력값 가져오기
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String animal = request.getParameter("animal");
		// 동일한 key로 여러갓이 전달된 경우 getParameterValues
		String foodArr[] = request.getParameterValues("food");
		
		System.out.println("name: " + name);
		System.out.println("color: " + color);
		System.out.println("animal: " + animal);
		System.out.println("foods: " + Arrays.toString(foodArr));
		
		// 2. 응답 메세지 작성(Response)
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
			out.println("<head>");
				out.println("<title>검사 결과</title>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>개인 취향 검사 결과</h1>");
				out.println("<p>"+name+"님의 검사결과</p>");
				out.println("<p>"+color+"색을 좋아합니다.</p>");
				out.println("<p>"+animal+"을 좋아합니다.</p>");
				out.println("<p>종아하는 음식 : "+Arrays.toString(foodArr)+"</p>");
			out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
