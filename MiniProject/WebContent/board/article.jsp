<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>매치메이커</title>
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<c:choose>
	<c:when test="${!empty id }">
		<script type="text/javascript">
			$(function() {
				var writer = ${article.writer}
				var id = ${id}
				
				$('#modify').click(function() {
					if(id == writer) {
						$(this).attr('hidden', true);
						$('#delete, #check').attr('hidden', true);
						$('#cancel, #modifyComplete').attr('hidden', false);
						$('#title, #content').removeAttr('readonly');	
					} else {
						alert('작성자만 수정이 가능합니다.');
					}
				});

				$('#modifyComplete').click(function() {
					$.ajax({
						type : 'post',
						url : '../update.board',
						data : {
							num : $('#num').val(),
							title : $('#title').val(),
							content : $('#content').val()
						},
						success : function(data) {
							alert(data);
							window.location.href = '../mmboard/';
						}
					});
				});

				$('#delete').click(function() {
					if(id == writer) {
						if (confirm('정말 삭제하시겠습니까?') == true) {
							$.ajax({
								type : 'post',
								url : '../delete.board',
								data : {
									num : $('#num').val()
								},
								success : function(data) {
									alert(data);
									window.location.href = '../mmboard/';
								}
							});
						};
					} else {
						alert('작성자만 삭제가 가능합니다.');
					}
				});
			});
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$(function () {
				$('#modify, #delete').click(function () {
					alert('회원이 아닙니다.');
				});
			});
		</script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	$(function() {
		$('#check').click(function() {
			window.location.href = '../mmboard/';
		});

		$('#cancel').click(function() {
			window.location.href = '../mmboard/';
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
		<span><a href="/">홈</a></span> <span><a href="/mmboard/">게시판</a></span>
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
						name="title" value="${article.title }" type="text" maxlength="50"
						readonly></li>
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
