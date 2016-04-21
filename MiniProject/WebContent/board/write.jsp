<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<html>
<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script type="text/javascript">
	$(function () {
		$('.save_button').click(function () {
			var article = {
				title: $('#title').val(),		
				writer: $('#writer').val(),
				content: $('#content').val()
			};
			
			$.ajax({
				url: '../Controller/insert.board',
				data: article,
				type: 'post',
				success: function (data) {
					alert(data);
					window.location.href = '../board';
				}
			});
		});		
		
		$('.cancel_button').click(function () {
			$.ajax({
				url: '',
				data: '',
				type: '',
				success: function (data) {
						
				}
			});
		});	
	});
	
	
</script>
<body>
<div class="top_line">
<div id="writeForm" class="div_wtitle">
  <ul>
    <li>
    	<span class="span_wtitle">아이디</span>
    	<input id="writer" type="text"> 
    </li>
    <li>
    	<span class="span_wtitle">제목</span>
        <input id="title" name="title" type="text" placeholder="제목" maxlength="50">
    </li>
    <li>
    	<textarea id="content" class="textarea_write"></textarea>
    </li>
    <li>
    	<input type="button" class="save_button">
    	<input type="button" class="cancel_button">
  	</li>
  </ul>
</div>
</div>
</body>
</html>