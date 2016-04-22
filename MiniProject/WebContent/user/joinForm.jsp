<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="/user/css/login.css">
</head>
<body>
<div class="top_line"></div>
<div class="join_box">
  <div class="join_form">
    <ul class="join_ul">
      <li class="info">
        <span class="join_span">아이디 입력</span>
        <div class="input_info"><input type="text" name="" maxlength="20" placeholder="아이디"></div>
        <p class="join_label">사용할 아이디를 입력해 주세요(5~20자 영문,숫자만)</p>
      </li>
      <li class="info">
        <span class="join_span">비밀번호</span>
        <div class="input_info"><input type="password" name="" placeholder="비밀번호">&nbsp;&nbsp;<input type="password" name="" placeholder="비밀번호 재입력"></div>
        <p class="join_label">영문,숫자 조합 6~20자</p>
      </li>
      <li class="info">
        <span class="join_span">이름 입력</span>
        <div class="input_info"><input type="text" name="" placeholder="실명"></div>
        <p class="join_label">실명을 입력해 주세요.</p>
      </li>
      <li class="info">
        <span class="join_span">나이 입력</span>
        <div class="input_info"><input type="text" name="" placeholder="나이"></div>
        <p class="join_label"></p>
      </li>
      <li class="info">
        <span class="join_span">이메일 입력</span>
        <div class="input_info"><input type="text" name="" placeholder="이메일주소" maxlength="50">
        </div>
        <p class="join_label"></p>
      </li>
      <li class="info">
        <div class="input_info" style="margin-left:109px;">
          <input type="button" class="done_button">&nbsp;&nbsp;<input type="button" class="cancle_button">
        </div>
      </li>
    </ul>
  </div>
</div>
</body>
</html>