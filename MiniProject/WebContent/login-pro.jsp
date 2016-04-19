<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${requestScope.result==null}">
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