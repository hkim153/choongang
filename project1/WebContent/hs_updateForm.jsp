<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>
	#upright{
			position: absolute;
   			top: 0px;
   			right: 0px;
   			border-style:solid;
	}
</style>
</head>
<body>
<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
<form action="hs_updatePro.do" enctype="multipart/form-data" method="post">
		<input type="hidden" name="num" value="${fs.fs_num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name = "id" value = "${fs.id }">
		<input type="hidden" name = "curid" value = "${sessionScope.id }">
		<input type="hidden" name = "rightpasswd" value = "${sessionScope.passwd}">
		<table border="1">
			<caption><h2>낚시터 정보 수정</h2></caption>
			<tr><td>번호</td><td>${fs.fs_num}</td></tr>
			<tr><td>낚시터 이름</td><td><input type="text" name="fs_name" required="required"
			 value="${fs.fs_name}"></td></tr>
			 <tr>
			<td>지역</td>
				<td>
				현재 지역:${fs.fs_reg }->
				<input type="text" name="fs_reg" list="choices" required="required" >
					<datalist id = "choices">
						<option value="경기도" label="경기도"></option>
						<option value="서울특별시" label="서울특별시"></option>
						<option value="인천광역시" label="인천광역시"></option>
						<option value="강원도" label="강원도"></option>
						<option value="충청북도" label="충청북도"></option>
						<option value="충청남도" label="충청남도"></option>
						<option value="세종특별자치시" label="세종특별자치시"></option>
						<option value="대전광역시" label="대전광역시"></option>
						<option value="경상북도" label="경상북도"></option>
						<option value="경상남도" label="경상남도"></option>
						<option value="대구광역시" label="대구광역시"></option>
						<option value="울산광역시" label="울산광역시"></option>
						<option value="부산광역시" label="부산광역시"></option>
						<option value="전라북도" label="전라북도"></option>
						<option value="전라남도" label="전라남도"></option>
						<option value="광주광역시" label="광주광역시"></option>
						<option value="제주특별자치도" label="제주특별자치도"></option>
					</datalist>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><textarea rows = "1" cols="50" name = "fs_addr" required="required">${fs.fs_addr}</textarea></td>
			</tr>
			<tr>
				<td>서식 어종</td>
				<td>현재 어종:
					<c:forEach var= "sfish" items = "${fishes }">
						${sfish }  
					</c:forEach>
					<c:forEach var = "fish" items = "${flist }">
						<input type = "checkbox" name = "어종" value = "${fish.f_name }">${fish.f_name }
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre><textarea rows="10" cols="40" name="fs_content"
				required="required">${fs.fs_content}</textarea></pre></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="fs_img"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${fs.id }</td> 
			</tr>
			<tr><td>암호</td><td><input type="password" name="passwd" required="required"></td></tr>
			<tr><td colspan="2"><input type="submit" value="수정완료" >
				</td></tr>
		</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>

		</div>
</body>
</html>