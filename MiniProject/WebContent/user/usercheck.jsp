<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<script type="text/javascript">
	$(function () {
		$('#check').click(function () {
			if(buttonChk == 'delete') {
				$.ajax({
					url: 'delete.user',
					type: 'post',
					data: {
						id: $('#id').val(),
						pw: $('#pw').val()
					},
					success: function (data) {
						if(data == 1) {
							alert('아이디가 삭제되었습니다.');
							window.location.href = 'logout-pro.jsp';
						} else {
							alert('비밀번호가 틀렸습니다.');
							window.location.href = '/';
						}
					}
				});
			} else {
				$.ajax({
					url: 'check.user',
					type: 'post',
					data: {
						id: $('#id').val(),
						pw: $('#pw').val()
					},
					success: function (data) {
						if(data == 1) {
							$.get('user/modify-form.jsp', function (data) {
								$('#main').html(data);
							});
						} else {
							alert('비밀번호가 틀렸습니다.');
							window.location.href = '/';
						}
					}
				});
			}
		});
	});
</script>

<h2>비밀번호 확인</h2>
<div>
	<label>아이디:&nbsp;&nbsp; </label><input id="id" name="id" type="text" value="${id }" readonly><br>
	<br> <label>비밀번호: </label><input id="pw" name="pw" type="text"><br>
	<br> <input id="check" type="submit" value="확인" style="width:45px;height:25px;">&nbsp;&nbsp;
	<input type="button" value="취소" style="width:45px;height:25px;" onclick="window.location.href='/';">
</div>
