<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#update").click(function(){
			$.ajax({
				type: 'post',
				url: 'Controller/login.do',
				data: {
					id: $('#id').val(),
					pw: $('#pw').val()
				},
				success: function(data){
					alert(data);
				}
			});
		});
		
		$("#delete").click(function(){
			$.ajax({
				type: 'post',
				url: 'Controller/login.do',
				data: {
					id: $('#id').val(),
					pw: $('#pw').val()
				},
				success: function(data){
					alert(data);
				}
			});
		});
		
		$("#logout").click(function(){
			$.ajax({
				type: 'post',
				url: 'Controller/login.do',
				data: {
					id: $('#id').val(),
					pw: $('#pw').val()
				},
				success: function(data){
					alert(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<button id="update">수정</button>
	<button id="delete">삭제</button>
	<button id="logout">로그아웃</button>
</body>
</html>