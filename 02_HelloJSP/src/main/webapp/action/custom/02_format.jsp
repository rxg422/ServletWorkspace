<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Format Library</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
		숫자데이터의 포맷 지정 <br>
			- 표현하고자 하는 숫자데이터 형식을 원하는 쓰임에 맞게 지정하는 태그 <br>
			
			fmt:formatNumber value='출력할 값'
			groupingUsed = 'true/false'
			type='percent/currency'
			currencySymbol='통화기호'
	</p>
	
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.765"/>
	<c:set var="num3" value="50000"/>
	
	단순출력 : ${ num1 } <br>
	세자리 단위로 출력 : <fmt:formatNumber value="${num1}"/> <br>
	percent : <fmt:formatNumber value="${num2}" type="percent"/> <br>
	currency : <fmt:formatNumber value="${num3}" type="currency"/> <br>
	currency : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="$"/> <br>
	
	<h3>2. formatDate</h3>
	<p>java.util.Date 객체의 출력형식을 지정</p>
	<c:set var="current" value="<%= new java.util.Date() %>"/>
	current : ${current}
	
	<ul>
		<li>현재 날짜 : <fmt:formatDate value="${current}" type="date"/></li>
		<li>현재 시간 : <fmt:formatDate value="${current}" type="time"/></li>
		<li>커스텀 : <fmt:formatDate value="${current}" pattern="yyyy-MM-dd HH:mm:ss"/> </li>
	</ul>
</body>
</html>