<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>매치메이커</title>
</head>
<body>
	<header>
		<h1>매치메이커</h1>
	</header>
	<nav>
		<span><a href="/">홈</a></span>
		<span><a href="/mmboard/">게시판</a></span>
	</nav>
	<section>
		<jsp:include page="/board/list.jsp"></jsp:include>
	</section>
</body>
</html>