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
<h2>보고싶은 물고기를 선택하여 주세요
<form action="fishingking.do?get_fish=${rank.get_fish }" >

	<select name="get_fish" id="get_fish" onchange="ch(${rank.num })" ondblclick="ch(${rank.num })">
		<option selected="selected">물고기선택</option>
		<option value="광어">광어</option>
		<option value="연어">연어</option>
	</select>
랭킹
</form>
</h2>
<c:choose>
<c:when test="${sessionScope.result eq 1 }">
	<table>
		<tr>
			<td>${id}<a href="sj_regform.do?id=${id}">나의 물고기 자랑하기</a></td>
		</tr>
	</table>
</c:when>
<c:when test="${sessionScope.result ne 1 }">
	<h3>로그인을 하시면 등록이 가능합니다</h3>
</c:when>
</c:choose>
	<table border="1">
		<tr>
			<th style="display:none;">num</th>
			<th>순위(순위 구현 완료)</th>
			<th>아이디(회원이랑 연동 완료)</th>
			<th>길이(그림으로 나타내는거랑 숫자나오게)</th>
			<th>등록일(길이 같을 경우 먼저 등록한 회원의 등수가 높음)</th>
		</tr>
			<c:forEach var ="rank" items="${list }">	
			<tr>
				<th style="display:none;">${rank.num }</th>
				<td>${startNum }등</td> 
				<td><a href = 'sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}&real_name=${rank.real_name}&result=${result}'>${rank.id }/${rank.get_fish }</a></td>
				<%-- <td><a href = 'sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}&real_name=${rank.real_name}'>${id }/${rank.get_fish }</a></td>--%>
				<td>${rank.length }cm<div style="width:${rank.length *2}%;" class="box1"></div></td>
				<td>${rank.reg_date }</td>				
			</tr>
			<c:set var="startNum" value="${startNum + 1 }"></c:set>	
			</c:forEach>
		
	</table>
</body>
</html>