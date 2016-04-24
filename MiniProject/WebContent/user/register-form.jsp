<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" type="text/css" href="/user/css/login.css"> -->
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<div>
	<div class="join_box">
		<div class="join_form">
			<ul class="join_ul">
				<li class="info"><span class="join_span">아이디 입력</span>
					<div class="input_info">
						<input type="text" name="id" id="id" maxlength="20" placeholder="아이디">&nbsp;&nbsp;<button id="confirmId">중복확인</button>
					</div>
					<p class="join_label">사용할 아이디를 입력해 주세요(5~20자 영문,숫자만)</p></li>
				<li class="info"><span class="join_span">비밀번호</span>
					<div class="input_info">
						<input type="password" name="pw" id="pw" placeholder="비밀번호">
					</div>
					<p class="join_label">영문,숫자 조합 6~20자</p></li>
				<li class="info"><span class="join_span">이름 입력</span>
					<div class="input_info">
						<input type="text" name="name" id="name" placeholder="실명">
					</div>
					<p class="join_label">실명을 입력해 주세요.</p></li>
				<li class="info"><span class="join_span">나이 입력</span>
					<div class="input_info">
						<input type="text" name="age" id="age" placeholder="나이">
					</div>
					<p class="join_label"></p></li>
				<li class="info"><span class="join_span">이메일 입력</span>
					<div class="input_info">
						<input type="text" name="email" id="email" placeholder="이메일주소" maxlength="50">
					</div>
					<p class="join_label"></p></li>
				<li class="info"></li>
			</ul>
		</div>
	</div>
	<div>
		<input type="submit" id="register" value="가입" style="width: 60px; height: 25px;">&nbsp;&nbsp;
		<input type="button" value="취소" style="width: 60px; height: 25px;" onclick="window.location.href = '/';">
	</div>
</div>
<script type="text/javascript">
	var check = -1;
	var id = $('#id');
	
	id.focus(function () {
		check = -1;
	});
	
	$('#register').click(function () {
		if(check == 1) {
			$.ajax({
				url: '../insert.user',
				type: 'post',
				data: {
					id: id.val(),
					pw: $('#pw').val(),
					name: $('#name').val(),
					age: $('#age').val(),
					email: $('#email').val()
				},
				success: function (data) {
					window.location.href = '/';
				}
			});	
		} else if(check == 0) {
			alert('중복된 아이디입니다.');
			id.focus();
		}
		else {
			alert('아이디 중복확인을 해주세요.');
			id.focus();
		}
	});

	$('#confirmId').click(function () {
		if(id.val() == null || id.val() == '') {
			alert('아이디를 입력해주세요.');
			id.focus();
			return;
		}
		
		$.ajax({
			url: 'confirm.user',
			type: 'get',
			data: {
				id: id.val()
			},
			success: function (data) {
				if(data == 0) {
					alert('가입할 수 있는 아이디입니다.');
					$('#pw').focus();
					check = 1;
				} else {
					alert('중복된 아이디입니다.');
					id.focus();
					check = 0;
				}
			}
		});
	});
</script>