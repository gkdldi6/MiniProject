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
			window.location.href = 'modify-form.jsp';
		});
		
		$("#delete").click(function(){
			window.location.href = 'delete-form.jsp';
		});
		
		$("#logout").click(function(){
			alert('로그아웃 되었습니다.');
			window.location.href = 'logout-pro.jsp';
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