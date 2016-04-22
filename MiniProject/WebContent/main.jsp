<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>매치메이커</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
		<h1>매치메이커</h1>
	</header>
	<nav>
		<span><a href="/">홈</a></span>
		<span><a href="/board">게시판</a></span>
	</nav>
	<section>
		<div class="top_line"></div>
		<jsp:include page="login-form.jsp"></jsp:include>
	</section>
</body>
</html>