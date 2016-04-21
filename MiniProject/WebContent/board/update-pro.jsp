<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<script type="text/javascript">
	$(function () {
		$('#test').click(function () {
			window.location.href = '/board/article';
		});
	});
</script>
</head>
<body>
	<button id="test">click</button>





<%-- <c:set var="result" value="Test" scope="session"/> --%>


<%-- <% --%>
// 	response.sendRedirect("../board/test.jsp");
<%-- %> --%>



</body>
</html>