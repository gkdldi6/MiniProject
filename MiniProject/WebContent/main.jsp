<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>매치메이커</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	var buttonChk;
</script>
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
		<div class="top_line"></div>
		<div id="main">
			<jsp:include page="user/login-form.jsp"></jsp:include>
		</div>
	</section>
</body>
</html>