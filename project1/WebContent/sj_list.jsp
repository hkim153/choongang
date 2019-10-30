<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style type="text/css">
	.box1{	
			height:30px;
			background:#ff6a00;
			width:30%;
		}
</style> 
<script type="text/javascript">
	function ch(num){
		var get_fish = document.getElementById('get_fish').value;
		location.href='fishingking.do?get_fish='+get_fish;	
	}
</script>
</head>
<body>
<h2>
<form action="fishingking.do?get_fish=${rank.get_fish }" >

	<select name="get_fish" id="get_fish" onchange="ch(${rank.num })" ondblclick="ch(${rank.num })">
		<option value="광어" selected="selected">광어</option>
		<option value="연어">연어</option>
	</select>
랭킹
</form>
</h2>
	<table>
		<tr>
			<td><a href="sj_regform.do">나의 물고기 자랑하기</a></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<th>순위(순위 구현 완료)</th>
			<th>아이디(회원이랑 연동할 예정)</th>
			<th>길이(그림으로 나타내는거랑 숫자나오게)</th>
			<th>등록일(길이 같을 경우 먼저 등록한 회원의 등수가 높음)</th>
		</tr>
			<c:forEach var ="rank" items="${list }">		
			<tr>
				<td>${startNum }등</td> 
				<td><a href = 'sj_content.do?num=${rank.num }&id=${rank.id }'>${rank.id }${rank.get_fish }</a></td>
				<td>${rank.length }cm<div style="width:${rank.length *2}%;" class="box1"></div></td>
				<td>${rank.reg_date }</td>				
			</tr>
			<c:set var="startNum" value="${startNum + 1 }"></c:set>	
			</c:forEach>
		
	</table>
</body>
</html>