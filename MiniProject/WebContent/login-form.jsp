<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
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
		
		$('#register').click(function(){
			location.href = 'user-form.jsp';
		});
	});
</script>
</head>
<body>
	
		<label>아이디</label>
		<input type="text" id="id" name="id">
		<label>비밀번호</label>
		<input type="text" id="pw" name="pw">
		<button id="register">가입</button>
		<button id="login">로그인</button>	
</body>
</html>