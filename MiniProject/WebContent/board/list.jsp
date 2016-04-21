<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/board/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_write").click(function() {
			document.location.href = "board/write.jsp";
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
				<c:forEach items="${board}" var="i">
					<tr onmouseover="this.style.backgroundColor='#eae9f7';"
						onmouseout="this.style.backgroundColor='';">
						<td>${i.num }</td>
						<td>${i.title }</td>
						<td>${i.writer }</td>
						<td>${i.date }</td>
						<td>${i.hit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="div_page_num">1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
			17 18 19 20</div>
		<div>
			<img id="btn_write" src="/board/image/btn_write.gif">
		</div>
	</div>
</body>
</html>