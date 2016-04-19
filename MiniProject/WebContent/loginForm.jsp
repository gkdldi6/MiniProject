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
		$("#submit").click(function(){
			$.ajax({
				type: 'post',
				url: '/MiniProject/Controller/login.do',
				data: {
					id: $('#id').val(),
					pw: $('#pw').val()
				},
				success: function(data){
					$('#loginMenu').html(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<c:if test="${requestScope.result==null}">
		<label>아이디</label>
		<input type="text" id="id" name="id">
		<label>비밀번호</label>
		<input type="text" id="pw" name="pw">
		<input type="button" value="로그인">
	</c:if>
	<c:if test="${requestScope.result==1}">
		<h1>로그인에 성공하였습니다.</h1>
	</c:if>
	<c:if test="${requestScope.result==0}">
		<h1>아이디와 비밀번호가 틀렸습니다.</h1>
	</c:if>
	<c:if test="${requestScope.result==-1}">
		<h1>에러 발생</h1>
	</c:if>
</body>
</html>