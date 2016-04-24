<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<html>
<head>
<title></title>
<!-- <link rel="stylesheet" type="text/css" href="/user/css/login.css"> -->
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<script type="text/javascript">
	$(function() {
		$('#id').focus();
		
		$("#login").click(function() {
			$.ajax({
				type : 'post',
				url : 'login.user',
				data : {
					id : $('#id').val(),
					pw : $('#pw').val()
				},
				dataType : 'xml',
				success : function(data) {
					var result = $(data).find('result').text();

					if (result == 1) {
						alert('로그인 되었습니다.');
						window.location.href = '/';
					} else {
						alert('아이디 또는 비밀번호가 틀렸습니다.');
					}
				}
			});
		});

		$('#register').click(function() {
			$.ajax({
				url: 'user/register-form.jsp',
				type: 'get',
				success: function (data) {
					$('#main').html(data);					
				}
			});
		});
	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty id }">
			<div class="login_main_box">
				<div class="login_form_box">
					<p>
						<input id="id" name="id" type="text" placeholder="아이디">
					</p>
					<p class="login_btn">
						<input id="pw" name="pw" type="password" placeholder="비밀번호">
					</p>
					<button id="login" class="button">로그인</button>&nbsp;&nbsp;
					<button id="register" class="button">회원가입</button>
				</div>
			</div>
		</c:when>
		<c:when test="${!empty id }">
			<jsp:include page="/user-menu.jsp"></jsp:include>
		</c:when>
	</c:choose>
	<c:if test="${!empty msg }">
	<script type="text/javascript">
		var msg = '${msg}';	
		alert(msg);
	</script>
	<c:remove var="msg"/>
</c:if>
</body>
</html>