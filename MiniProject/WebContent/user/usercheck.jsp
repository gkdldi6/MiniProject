<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원확인</title>
</head>
<body>
	<form action="check.user" method="post">
		<label>ID: </label><input name="id" type="text"><br>
		<label>PW: </label><input name="pw" type="text"><br>
		<input type="submit">
	</form>
</body>
</html>