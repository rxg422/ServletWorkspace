<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax</title>
</head>
<body>
	<h1>Ajax 개요</h1>
	
	<!-- 
		Asynchronous JavaScript And XML
		 - 서버로부터 데이터를 가져와 전체 페이지를 새로 고치는 것이 아닌 일부분만 로드할 수 있도록 하는 기법
		 - a태그나 form태그를 이용한 요청은 통기식 요청(응답결과가 반환되어야 확인가능)
		 
		* 동기식 / 비동기식
		 - 동기식
		  - 요청 처리 후 해당하는 응답페이지가 반환되어야 그 다음 작업이 가능
		  - 서버에서 호출된 결과까지의 시간이 지연되면 대기하여야 함. 항상 전체 페이지가 리로드 됨.
		 - 비동기식
		  - 현재 페이지를 유지하며 중간에 추가적인 요청 가능
		  - 검색어 자동완성, 아이디 중복체크, 실시간 검색
		  - 서버에서 결과를 반환해주기까지 시간이 걸려도 현재 페이지를 이용하는데 문제가 없다.
	-->
	
	<hr>
	
	<h1>XMLHttpRequest 객체를 이용한 ajax</h1>
	<button onclick="ajaxTest1()">ajax get</button>
	<button onclick="ajaxTest2()">ajax post</button>

	<div id="target">
		<Script>
			// XmlHttpRequest를 이용한 비동기 통신
			function ajaxTest1() {
				// 1. XmlHttpRequest 객체 생성
				const xhr = new XMLHttpRequest();

				// 2. xhr 객체 설정 : open("전송방식", "주소", [동기/비동기])
				xhr.open("get", "/ajax/ajaxTest.do?id=admin");

				// 3. 요청에 대한 응답결과를 처리할 이벤트 리스너 기술
				xhr.onreadystatechange = function() {
					// readyState : 전송상태를 관리하는 속성
					if(xhr.readyState == 4) {
						// xhr.status : 응답결과를 관리하는 속성
						if(xhr.status == 200) { // 응답 성공
							console.log(xhr.responseText); // xhr.responseText : 정상수신 시 응답데이터가 담기는 영역
							target.innerHTML = "<h3>GET : "+xhr.responseText+"<h3>";
						}
						else if(xhr.status == 404) { // 응답 실패
							alert("찾는 페이지가 존재하지 않습니다.");
						}
						else {
							alert("Error");
						}
					}
				};

				// 4. 요청
				xhr.send();
			}

			function ajaxTest2() {
				const xhr = new XMLHttpRequest();
				xhr.open("post", "/ajax/ajaxTest.do");
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4) {
						if(xhr.status == 200) {
							target.innerHTML = `<h3>POST : \${xhr.responseText}</h3>`;
						}
						else {
							alert("Error!");
						}
					}
				};
				// body 영역에 담긴 데이터의 형식을 기술
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("id=user01"); // send의 매개변수 = body영역
			}
		</Script>

		<hr>
		
	</div>
	
	<h1>fetch 함수를 이용한 ajax</h1>
	<button onclick="fetch01()">Fetch Get Test</button>
	<button onclick="fetch02()">Fetch Post Test</button>
		
	<div id="target2">
		<script>
    		function  fetch01() {
				/*
					fetch함수
						- es6에서 추가된 비동기 함수, 간결한 문법으로 서버와 통신가능
						- promise 기반으로 설계. 비동기 요청 성공시와 실패시 처리를 위한 메서드 제공
						- fetch 함수는 비동기 요청시 promise객체 반환,서버로부터 데이터를 응답받기 전까지 다른 작업 수행 가능
						
					promise 
						- 비동기 작업의 처리결과를 나타내는 객체. 3가지 상태값 존재
						1) pending : 비동기 작업을 처리중인 상태(초기 상태)
						2) resolved : ㅣ동기 작업 처리 완료 상태(응답받은 상태)
						3) rejected : 비동기 작업 처리 실패 상태(응답x)
				*/
				// fetch (url, [options]) : options -> 요청에 대한 옵션(method, headers, body...)
				fetch("/ajax/ajaxTest.do?id=admin").then(function(response) { // then() : 요청 성공시 실행 함수
					console.log(response);
					/* if(!(response.ok && respons.status == 200)) {
						throw new Error("에러발생");
					} */
					return response.text(); // text() : Promise 반환
				}).then(function(text) {
					target2.innerHTML = "<h3>GET : "+text+"</h3>";
				}).catch(function(error) { // Promise객체의 결과가 reject되는 경우 실행
					console.log(error);
				}).finally(function() {
					console.log("작업 완료");
				}); 
			}
			
			function fetch02() {
				fetch("/ajax/ajaxTest.do", {
					method:"post",
					body:"id=user01",
					headers:{"Content-type":"application/x-www-form-urlencoded"}
				}).then(function(response) {
					return response.text();
				}).then(function(text) {
					target2.innerHTML = `<h3>Fetch Post : \${text}</h3>`;
				});
				
			}
   		</script>
	
	</div>

    
</body>
</html>