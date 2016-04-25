<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<label>아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;<input id="id" type="text" name="id" value="${id }" readonly><br><br>
	<label>비밀번호</label>&nbsp;<input id="pw" type="text" name="pw"><br><br>
	<label>이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="name" type="text" name="name"><br><br>
	<label>나이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="age" type="text" name="age"><br><br>
	<label>이메일</label>&nbsp;&nbsp;&nbsp;&nbsp;<input id="email" type="text" name="email"><br><br>
	<button id="modify">수정</button>&nbsp;&nbsp;<button onclick="window.location.href='/';">취소</button>
</div>
<script type="text/javascript">
	$('#modify').click(function () {
		$.ajax({
			url: 'update.user',
			type: 'post',
			data: {
				id: $('#id').val(),
				pw: $('#pw').val(),
				name: $('#name').val(),
				age: $('#age').val(),
				email: $('#email').val()
			},
			success: function (data) {
				if(data == 1) {
					alert('회원정보가 수정되었습니다.');
					window.location.href = '/';
				} else {
					alert('회원정보수정에 실패했습니다.');
					window.location.href = '/';
				}
			}
		});
	});
</script>
