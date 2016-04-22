<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="/user/css/login.css">
<script src="https://code.jquery.com/jquery-1.12.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			$.ajax({
				type: 'post',
				url: 'login.user',
				data: {
					id: $('#id').val(),
					pw: $('#pw').val()
				},
				dataType: 'xml',
				success: function(data){
					var result = $(data).find('result').text();
					alert(result);
					
					if(result==1) {
						window.location.href = '/';
					} else if(result==-1) {
						
					} else {
						
					}
				}
			});
		});
		
		$('#register').click(function(){
			window.location.replace('register-form.jsp');
		});
	});
</script>
</head>
<body>
<div class="top_line"></div>
<div class="login_main_box">
  <div class="login_form_box">
    <img src="/user/image/login_tit.gif">
    <form action="" method="post">
      <p><input id="id" name="id" type="text" placeholder="아이디"></p>
      <p class="login_btn"><input id="pw" name="pw" type="password" placeholder="비밀번호">
         <input name="login" type="image" src="/user/image/btn_login.gif" class="btn_img"></p>
      <p><a href=""><img src="/user/image/btn_join.gif"></a>
    </form>
  </div>
</div>
</body>
</html>