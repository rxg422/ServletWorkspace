package com.kh.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/menuOrder.do")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MenuServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int price = 0;
		String mainMenu = request.getParameter("main_menu");
		String sideMenu = request.getParameter("side_menu");
		String drinkMenu = request.getParameter("drink_menu");
		
		switch(mainMenu) {
		case "한우버거" -> price += 5000;
		case "치즈버거" -> price += 4000;
		case "밥버거" -> price += 4500;
		}
		
		switch(sideMenu) {
		case "감자튀김" -> price += 1500;
		case "어니언링" -> price += 1700;
		}
		
		switch(drinkMenu) {
		case "콜라" -> price += 1000;
		case "사이다" -> price += 1000;
		case "커피" -> price += 1500;
		case "밀크쉐이크" -> price += 2500;
		}
		
		request.setAttribute("price", price);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/menu/menuOrder.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
