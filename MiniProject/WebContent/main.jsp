<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
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
		<jsp:include page="login-form.jsp"></jsp:include>
	</section>
</body>
</html>