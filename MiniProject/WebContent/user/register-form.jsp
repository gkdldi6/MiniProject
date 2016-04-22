<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/user/css/login.css">
</head>
<body>
	<div class="top_line"></div>
	<form action="../insert.user" method="post">
		<div class="join_box">
			<div class="join_form">
				<ul class="join_ul">
					<li class="info"><span class="join_span">아이디 입력</span>
						<div class="input_info">
							<input type="text" name="id" maxlength="20" placeholder="아이디">
						</div>
						<p class="join_label">사용할 아이디를 입력해 주세요(5~20자 영문,숫자만)</p></li>
					<li class="info"><span class="join_span">비밀번호</span>
						<div class="input_info">
							<input type="password" name="pw" placeholder="비밀번호">
						</div>
						<p class="join_label">영문,숫자 조합 6~20자</p></li>
					<li class="info"><span class="join_span">이름 입력</span>
						<div class="input_info">
							<input type="text" name="name" placeholder="실명">
						</div>
						<p class="join_label">실명을 입력해 주세요.</p></li>
					<li class="info"><span class="join_span">나이 입력</span>
						<div class="input_info">
							<input type="text" name="age" placeholder="나이">
						</div>
						<p class="join_label"></p></li>
					<li class="info"><span class="join_span">이메일 입력</span>
						<div class="input_info">
							<input type="text" name="email" placeholder="이메일주소" maxlength="50">
						</div>
						<p class="join_label"></p></li>
					<li class="info">
						<div class="input_info" style="margin-left: 109px;">
							<input type="submit" value="가입" class="button">&nbsp;&nbsp;<input
								type="button" value="취소" onclick="history.back();" class="button">
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>