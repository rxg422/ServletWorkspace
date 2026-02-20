package com.kh.basic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleServlet
 */
@WebServlet("/life")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LifeCycleServlet() {
        super();
        System.out.println("Servlet 객체 최초 생성");
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	System.out.println("init() 호출");
    }
    
    // 사용자의 요청방식에 따라 doGet() 또는 doPost() 호출
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	super.service(req, resp);
    	String method = req.getMethod();
    	System.out.println("service() : " + method);
    	
    	if(method.equals("GET")) {
    		doGet(req, resp);
    	}
    	else {
    		doPost(req, resp);
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
