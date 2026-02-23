<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Functions Library</title>
</head>
<body>
	<h1>JSTL Function Library</h1>
	<c:set var="str" value="How are you?"/>
	
	str : ${str} <br>
	str 길이 : ${fn:length(str)} <br>
	str 길이 : ${str.length()} <br>	
	
	대문자 변환 : ${fn:toUpperCase(str)} <br>
	대문자 변환 : ${str.toUpperCase()} <br>
	
	are의 시작 인덱스 : ${fn:indexOf(str, 'are')} <br>
	are의 시작 인덱스 : ${str.indexOf('are')} <br>
	
	are을 were로 변환 : ${fn:replace(str, 'are', 'were')} <br>
	are을 were로 변환 : ${str.replace('are', 'were')} <br>
	
	<br>
	
	str에 are이 포함되어 있는지 검사 <br>
	<c:if test="${fn:contains(str, 'are')}">
		포함!
	</c:if> <br>
</body>
</html>