<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error500.jsp" isELIgnored="false"%>
<%@ page import= "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어</title>
</head>
<body>
	<%
		ArrayList<String> list = new ArrayList<>();
		list.add("servlet");
		list.add("jsp");
	%>
	
	<p>0번 인덱스값 : <%= list.get(0) %></p>
	<p>10번 인덱스값 : <%= list.get(10) %></p>
</body>
</html>