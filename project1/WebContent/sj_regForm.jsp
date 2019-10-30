<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.table1 {
		border-collapse:collapse;
	}
	ul {
		list-style-type: none;
	}
</style>
</head>
<body>
<h2>등록 게시판</h2>
<form action="sj_regpro.do">
<table class="table1" border="1">
	어종 
	 <ul>
		 <li>
			<label><input type="radio" name="get_fish" value="광어">광어</label>
		  	<label><input type="radio" name="get_fish" value="연어">연어</label>
		</li>
	</ul>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id">원래는 가져오는건데 아직은 적는걸로</td>
	</tr>
	<tr>
		<th>물고기 길이</th>
		<td><input type="text" name="length"></td>
	</tr>
 	<tr>
		<th>사진 등록하기</th>
		<td>.jpg<input type="file" name="image"></td>
	</tr>
	<tr>
		<th>리뷰</th>	
		<td><input type="text" name="content"></td>
	</tr>
</table>
<input type="submit" value="제출">
<input type="reset" value="취소">
<input type="button" value="뒤로가기" onclick="history.back(-1)">
</form>
</body>
</html>