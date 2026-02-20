<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.action.model.vo.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 스클립트릿과 표현식을 이용한 각 영역에 담긴 값 추출</h3>
	<%
		// request scope
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		// session scope
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	<p>
		학원명 :  <%= academy %> <br>
		강의장 :  <%= classRoom %> <br>
		강사 정보 :  <%= teacher %> <br>
		수강생 정보 :  <%= student %>
	</p>
	
	<hr>
	
	<h3>2. EL을 활용한 데이터 추출</h3>
	<p>
		<!-- 
			EL로 teacher에 접근시 teacher의 자료형은 Person.
			Person과 같이 참조가료형의 각필드에 담긴 값을 출력하고자 한다면 객체명.필드명 으로 접근
		-->
		학원명 : ${ academy } <br>
		강의장 : ${ classRoom } <br>
		강사 정보 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender } <br>
		수강생 정보 : ${ student }
	</p>
	
	<hr>
	
	<h3>3. EL 사용시 내장 객체들에 저장된 키값이 동일한 경우</h3>
	<!--
		공유범위가 가장 적은 Scope부터 키값을 탐색한다.
		page -> request -> session -> application
		각 스코프를 탐색하며 내가 지정한 키값이 존재하는 경우 해당 기캆을 화면상에 바인딩
	-->
	scope값 : ${ scope } <br>
	
	<hr>
	
	<h3>4. scope 영역에 직접 접근하여 데이터 가져오기</h3>
	<%
		pageContext.setAttribute("scope", "page");
	%>
	pageScope에 담긴 값 : ${ scope } 또는 ${ pageScope.scope } <br>
	requestScope에 담긴 값 : ${ requestScope.scope } <br>
	sessionScope에 담긴 값 : ${ sessionScope.scope } <br>
	applicationScope에 담긴 값 : ${ applicationScope.scope } <br>
</body>
</html>