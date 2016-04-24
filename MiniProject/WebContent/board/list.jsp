<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>매치메이커</title>
<link rel="stylesheet" type="text/css" href="/board/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<c:choose>
	<c:when test="${!empty id }">
		<script type="text/javascript">
			var id = '${id}';
			
			$(function() {
				$("#btn_write").click(function() {
					$.ajax({
						type: 'get',
						url: '/select.board',
						data: {
							id: id	
						},
						success: function (data) {
							$('section').html(data);
						}
					});
				});
			});
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$(function () {
				$("#btn_write").click(function() {
					alert('회원이 아닙니다.');
				});
			});
		</script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	$(function () {
		$('tbody > tr').click(function () {
			$(this).addClass('click');
			var query = {num: $('.click > td:eq(0)').text()};
			$(this).removeClass('click');
			
			$.ajax({
				type: 'get',
				url: '/mmboard/article',
				data: query,
				success: function (data) {
					window.location.href = this.url;
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="top_line"></div>
	<div class="table_list">
		<table width="100%" style="table-layout: fixed;">
			<colgroup>
				<col width="7%">
				<col>
				<col width="14%">
				<col width="7%">
				<col width="6%">
			</colgroup>
			<thead class="thead_list">
				<tr>
					<th><img src="/board/image/title_no.gif"></th>
					<th><img src="/board/image/title_subject.gif"></th>
					<th><img src="/board/image/title_writer.gif"></th>
					<th><img src="/board/image/title_date.gif"></th>
					<th><img src="/board/image/title_hit.gif"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${board}" var="article">
					<tr onmouseover="this.style.backgroundColor='#eae9f7';"
						onmouseout="this.style.backgroundColor='';">
						<td>${article.num }</td>
						<td>${article.title }</td>
						<td>${article.writer }</td>
						<td>${article.date }</td>
						<td>${article.hit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="div_page_num">
<!-- 		1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 -->
		</div>
		<div>
			<img id="btn_write" src="/board/image/btn_write.gif">
		</div>
	</div>
</body>
</html>