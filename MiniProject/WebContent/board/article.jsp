<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>매치메이커</title>
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<c:if test="${!empty id }">
	<script type="text/javascript">
		$(function() {
			$('#modify').click(function () {
				$(this).attr('hidden', true);
				$('#delete').attr('hidden', true);
				$('#check').attr('hidden', true);
				$('#cancel').attr('hidden', false);
				$('#modifyComplete').attr('hidden', false);
				$('#title').removeAttr('readonly');
				$('#content').removeAttr('readonly');
			});
			
			$('#modifyComplete').click(function () {
				$.ajax({
					type: 'post',
					url: '../update.board',
					data: {
						num: $('#num').val(),
						title: $('#title').val(),
						content: $('#content').val()
					},
					success: function (data) {
						alert(data);
						window.location.href = '../board';
					}
				});
			});
			
			$('#delete').click(function () {
				if(confirm('정말 삭제하시겠습니까?') == true) {
					$.ajax({
						type: 'post',
						url: '../delete.board',
						data: {
							num: $('#num').val()
						},
						success: function (data) {
							alert(data);
							window.location.href = '../board';
						}	
					});
				} ;
			});
		});
	</script>
</c:if>
<script type="text/javascript">
	$(function () {
		$('#check').click(function() {
			window.location.href = '../board';
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="/board/css/style.css">
</head>
<body>
	<header>
		<h1>매치메이커</h1>
	</header>
	<nav>
		<span><a href="/">홈</a></span> <span><a href="/board">게시판</a></span>
	</nav>
	<section>
		<div class="top_line">
			<div id="writeForm" class="div_wtitle">
				<ul>
					<li><span class="span_wtitle">글 번호</span> <input id="num"
						type="text" value="${article.num }" readonly></li>
					<li><span class="span_wtitle">날짜</span> <input id="date"
						type="text" value="${article.date }" readonly></li>
					<li><span class="span_wtitle">아이디</span> <input id="writer"
						type="text" value="${article.writer }" readonly></li>
					<li><span class="span_wtitle">제목</span> <input id="title"
						name="title" value="${article.title }" type="text" maxlength="50" readonly></li>
					<li><textarea id="content" class="textarea_write" readonly>${article.content }</textarea></li>
					<li><button id="check">확인</button>
						<button id="modify">수정</button>
						<button id="modifyComplete" hidden="true">수정 완료</button>
						<button id="delete">삭제</button>
						<button id="cancel" hidden="true">취소</button></li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>
