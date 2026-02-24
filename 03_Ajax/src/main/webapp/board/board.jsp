<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/board/board.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class='wrapper'>
		<header>
			<h3 style="fontWeight: bolder">KH C CLASS</h3>
		</header>
		<nav>
			<a id='list'>게시판</a> <a id='insert'>등록</a>
		</nav>
		<div class='outer'>
			<!-- 
				게시글 목록,
				게시글 등록,
				게시글 상세보기				
			 -->						
		</div>
	</div>
	<script>
		//첫 요청
		function showList(){
			$.ajax({
				url : '/ajax/board/list',
				success : function(data){
					$(".outer").html(data);
				},
				error : function(xhr, status){
					console.log(xhr)
				}
			})
		}
		showList();
		$("#list").on('click',function(e){
			showList();
		});
		
		$("#insert").on('click',function(e){
			$.ajax({
				url : '/ajax/board/insert',
				success : function(data){
					$(".outer").html(data);
				},
				error : function(xhr, status){
					console.log(xhr);
				}
			})
		});
		
		$(".outer").on("click", "table.list-table>tbody>tr", function () {
			var bno = $(this).children().eq(0).text();
			console.log(bno)
			$.ajax({
				url : '/ajax/board/view',
				data : {bno},
				success : function(data) {
					$('.outer').html(data);
				},
				error : function(xhr, sattus) {
					console.log(xhr);
				}
			});
		});
		
		$(".outer").on("click", "table.enroll-table #btn", function() {
			$.ajax({
				url : "/ajax/board/insert",
				data : {
					title : $("[name=title]").val(),
					wirter : $("[name=nickname]").val(),
					content : $("[name=content]").val()
				},
				method : "post",
				success : function(data) {
					alert("저장성공!");
					showList();
				}/* 
				error : function(err) {
					alert("저장실패");
				} */
			})
		});
	</script>

</body>
</html>