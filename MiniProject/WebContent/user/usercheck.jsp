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
							alert('���̵� �����Ǿ����ϴ�.');
							window.location.href = 'logout-pro.jsp';
						} else {
							alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');
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
						alert(this.url);
						
						if(result == 1) {
							$('#main').html(data);
						} else {
							alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');
							window.location.href = '/';
						}
					}
				});
			}
		});
	});
</script>

<h2>��й�ȣ Ȯ��</h2>
<div>
	<label>���̵�:&nbsp;&nbsp; </label><input id="id" name="id" type="text" value="${id }" readonly><br>
	<br> <label>��й�ȣ: </label><input id="pw" name="pw" type="text"><br>
	<br> <input id="check" type="submit" value="Ȯ��" style="width:45px;height:25px;">&nbsp;&nbsp;
	<input type="button" value="���" style="width:45px;height:25px;" onclick="window.location.href='/';">
</div>
