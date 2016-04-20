<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<html>
<% request.setCharacterEncoding("utf-8"); %>

<link rel="stylesheet" type="text/css" href="css/style.css">
<body>
<div class="top_line">
<div id="writeForm" class="div_wtitle">
  <ul>
    <li>
    	<span class="span_wtitle">닉네임</span>
    </li>
    <li>
    	<span class="span_wtitle">비밀번호</span>
        <input id="passwd" name="passwd" type="password" placeholder="6~16자 숫자/문자" maxlength="16">
    </li>
    <li>
    	<span class="span_wtitle">제목</span>
        <input id="subject" name="subject" type="text" placeholder="제목" maxlength="50">
    </li>
    <li>
    	<textarea id="content" class="textarea_write"></textarea>
    </li>
    <li>
    	<input type="button" class="save_button">
    	<input type="button" class="cancle_button">
  	</li>
  </ul>
</div>
</div>
</body>
</html>