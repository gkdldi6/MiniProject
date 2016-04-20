<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_write").click(function(){
			document.location.href = "write.jsp";
		});
	});
</script>
</head>
<body>
<div class="top_line"></div>
<div class="table_list">
<table width="100%" style="table-layout:fixed;">
<colgroup>
<col width="7%">
<col>
<col width="14%">
<col width="7%">
<col width="6%">
</colgroup>
<thead class="thead_list">
<tr>
<th>
<img src="Image/title_no.gif">
</th>
<th>
<img src="Image/title_subject.gif">
</th>
<th>
<img src="Image/title_writer.gif">
</th>
<th>
<img src="Image/title_date.gif">
</th>
<th>
<img src="Image/title_hit.gif">
</th>
</tr>
<!-- 내용 ROW 테이블 추가 시작 -->
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<tr onmouseover="this.style.backgroundColor='#eae9f7';" onmouseout="this.style.backgroundColor='';">
  <td>406916</td>
  <td><a href="">류조 넨도 개봉</a></td>
  <td><a href="">넨도링</a></td>
  <td>2016.04.20</td>
  <td>3</td>
</tr>
<!-- 내용 ROW 테이블 추가 끝 -->
</thead>
</table>
<!-- 페이징 처리부분 구현 -->
<div class="div_page_num">1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20</div>
<!-- 글쓰기버튼 -->
<div>
<img id="btn_write" src="Image/btn_write.gif">
</div>
</div>
</body>
</html>