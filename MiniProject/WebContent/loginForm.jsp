<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${requestScope.result==null}">
		<form action="/MiniProject/Controller/login.do" method="post">
			<label>아이디</label>
			<input type="text" name="id">
			<label>비밀번호</label>
			<input type="text" name="pw">
			<input type="submit">
		</form>
	</c:if>
	<c:if test="${requestScope.result==0}">
		<h1>아이디와 비밀번호가 틀렸습니다.</h1>
	</c:if>
	<c:if test="${requestScope.result==-1}">
		<h1>에러 발생</h1>
	</c:if>
</body>
</html>