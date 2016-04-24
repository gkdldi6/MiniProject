<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<result>${result }</result>
<script type="text/javascript">
	$(function () {
		
	});

</script>
<div>
	<label>아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;<input id="id" type="text" name="id" value="${id }" readonly><br><br>
	<label>비밀번호</label>&nbsp;<input id="pw" type="text" name="pw"><br><br>
	<label>이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="name" type="text" name="name"><br><br>
	<label>나이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="age" type="text" name="age"><br><br>
	<label>이메일</label>&nbsp;&nbsp;&nbsp;&nbsp;<input id="email" type="text" name="email"><br><br>
	<button>수정</button>&nbsp;&nbsp;<button>취소</button>
</div>
