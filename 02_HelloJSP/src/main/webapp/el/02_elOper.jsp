<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 연산 방법</h1>
	<h3>1. 산술연산</h3>
	<p>
		* 스크립틀릿을 사용한 연산 <br>
		10 + 3 = <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	</p>
	<p>
		* EL을 사용한 연산 <br>
		10 + 3 = ${ big + small } <br>
		10 - 3 = ${ big - small } <br>
		${ big } * ${ small } = ${ big * small } <br>
		${ big } / ${ small } = ${ big / small } <br>
		${ big } div ${ small } = ${ big div small } <br>
		${ big } % ${ small } = ${ big % small } <br>
		${ big } mod ${ small } = ${ big mod small } <br>
	</p>
	
	<hr>
	
	<h3>2. 숫자간 대소비교</h3>
	<p>
		10 > 3 = ${ big > small } <br>
		10 gt 3 = ${ big gt small } <br>
		
		10 < 3 = ${ big < small } <br>
		10 lt 3 = ${ big lt small } <br>
		
		10 >= 3 = ${ big >= small } <br>
		10 ge 3 = ${ big ge small } <br>
		
		10 <= 3 = ${ big <= small } <br>
		10 le 3 = ${ big le small } <br>
	</p>
	
	<hr>
	
	<h3>3. 동등비교 연산</h3>
	<p>
		* 스크립틀릿 방식 <br>
		<%
			String sOne = (String)request.getAttribute("sOne");
			String sTwo = (String)request.getAttribute("sTwo");
		%>
		sOne equals sTwo = <%= sOne.equals(sTwo) %> <br>
		sOne == sTwo = <%= sOne == sTwo %> <br>
	</p>
	<p>
		* EL 연산 <br>
		10 == 3 = ${ big == small } <br>
		10 eq 3 = ${ big eq small } <br>
		big == 10 = ${ big == 10 } <br>
		big eq 10 = ${ big eq 10 } <br>
		<br>
		<!-- EL에서 동등비교는 equals 방식으로 동작 -->
		sOne eq sTwo = ${ sOne eq sTwo } <br>
		sOne == sTwo = ${ sOne == sTwo } <br>
		<br>
		sOne != sTwo = ${ sOne != sTwo } <br>
		sOne ne sTwo = ${ sOne ne sTwo } <br>
		<br>
		sOne == "안녕" = ${ sOne == "안녕" }, ${ sOne == '안녕' } <br>
		sOne == "안녕" = ${ sOne eq "안녕" }, ${ sOne eq '안녕' } <br>
	</p>
	
	<hr>
	
	<h3>4. 객체가 null인지 list가 비어있는지 확인하는 연산자</h3>
	<p>
		pTwo == null = ${ pTwo == null } <br>
		pTow empty pTwo = ${ empty pTwo } <br>
		pOne == null = ${ pOne == null } <br>
		pOne empty null = ${ empty pOne } <br>
		<br>
		empty lOne = ${ empty lOne } <br>
		empty lTwo = ${ empty lTwo } <br>
	</p>
	
	<hr>
	
	<h3>5. 논리연산자</h3>
	<p>
		AND 연산 : ${ true && false }, ${ true and false } <br>
		OR 연산 : ${ true || false }, ${ true or false } <br>
	</p>
	
	<script >
		// jsp 페이지 내부에서 템플릿문법을 사용하려면
		// 1. 페이지 지시어에 isElIgnored 설정 추가
		// 2. 템플릿 문법 앞에 \(이스케이프) 기호 추가
		var name = "김태환";
		console.log('제 이름은 ' + name + '입니다.');
		console.log(`제 이름은 \${name}입니다.`);
	</script>
</body>
</html>