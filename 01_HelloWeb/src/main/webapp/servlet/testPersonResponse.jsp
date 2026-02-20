<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<% 
	// 자바 소스코드를 작성하는 영역
	System.out.println("자바");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String animal = request.getParameter("animal");	
	String foodArr[] = request.getParameterValues("food");
	
	// Servlet에서 저장한 데이터
	String recommendation = (String)request.getAttribute("recommendation");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>개인취향 검사 결과</h1>
	<p><% out.print(name); %>님의 개인취향 검사 결과는</p>
	<p><%= color %>색을 좋아합니다.</p> 
	<p>동물은 <%= animal %>을 좋아합니다.</p>
	<% if(foodArr != null) {%>
		<p>음식은 <%= Arrays.toString(foodArr) %>을 좋아합니다.</p>
	<% } %>
	<p>오늘의 추천음식은 <%= recommendation %>입니다.</p>
</body>
</html>