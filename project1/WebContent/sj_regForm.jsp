<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.sj_table1 {
	border-collapse: collapse;
	margin: auto;
}
	ul {
		list-style-type: none;
	}
	#d {
		text-align: center;
	}
	#sj_ee {
		height: 40px;
	}
	#f {
		height: 200px;
	}
</style>
</head>
<body>
<form action="sj_regpro.do?id=${id }" enctype="multipart/form-data" method="post">
<table class="sj_table1" border="1">
<h2 id="d">등록 게시판</h2>
<p><br><p>
	 <ul>
		 <li id="d">
			어종 <label><input type="radio" name="get_fish" value="광어" checked="checked">광어</label>
		  	<label><input type="radio" name="get_fish" value="연어">연어</label>
		  	<label><input type="radio" name="get_fish" value="문어">문어</label>
		  	<label><input type="radio" name="get_fish" value="숭어">숭어</label>
		  	<label><input type="radio" name="get_fish" value="송어">송어</label>
		  	<label><input type="radio" name="get_fish" value="갈치">갈치</label>
		</li>
	</ul>
	<br>
	<tr id="sj_ee">
		<th>좋아하는 숫자 입력</th>
		<td><input type="text" name="num" placeholder="3자리 이상 추천" required="required"></td>
	</tr>
	<tr id="sj_ee">
		<th>아이디</th>
		<td>${id }</td>
	</tr>
	<tr id="sj_ee">
		<th>물고기 길이</th>
		<td><input type="text" name="length" required="required">cm</td>
	</tr>
 	<tr id="sj_ee">
		<th>사진 등록하기</th>
		<td><input type="file" name="img_folder" required="required"></td>
	</tr>
	<tr id="f">
		<th>리뷰</th>	
		<td><textarea rows="14" cols="50" name="content" placeholder="물고기를 잡은 기분을 표현해 주세요" required="required"></textarea></td>
	</tr>
</table>
<br>
		<div colspan="2" style="text-align:center">
		<input type="submit" value="제출">
		<input type="reset" value="취소">
		<input type="button" value="뒤로가기" onclick="history.back(-1)"></div>
</form>
</body>
</html>