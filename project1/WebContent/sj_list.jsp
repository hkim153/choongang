<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
 <style type="text/css">
	.box1{	
			height:30px;
			background:#ff6a00;
			width:30%;
		}
	#sj_a{
		height:1000px;
		margin-left: 35%;
		}
 	.sj_b {
		margin-left: -5%;
	} 
	table {
		border-collapse: collapse;
		}
	.sj_b tr{
		border-top: 1px groove;
		border-bottom: 1px groove;
		}
	#sj_l{
		width:300px;
		text-align: center;
	}
	#sj_i{
		text-align: center;
		width:200px;
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
<div id="wrap">
<div>
<header> <jsp:include page="header.jsp"></jsp:include> </header>
</div>
<div id="sj_a">
<h2><h2>보고싶은 물고기를 선택하여 주세요</h2>
<form action="fishingking.do?get_fish=${rank.get_fish }" >

	<select name="get_fish" id="get_fish" onchange="ch(${rank.num })" ondblclick="ch(${rank.num })">
		<option selected="selected">물고기선택</option>
		<option value="광어">광어</option>
		<option value="연어">연어</option>
		<option value="문어">문어</option>
		<option value="숭어">숭어</option>
		<option value="송어">송어</option>
		<option value="갈치">갈치</option>
	</select>
랭킹
</form>
</h2>
<p>
<c:choose>
<c:when test="${sessionScope.result eq 1 }">
	<table class="a">
		<tr>
			<td><a href="sj_regform.do?id=${id}">나의 물고기 자랑하기</a></td>
		</tr>
	</table>
</c:when>
<c:when test="${sessionScope.result ne 1 }">
	<h3>로그인을 하시면 등록이 가능합니다</h3>
</c:when>
</c:choose>
<div class="sj_b">
	<table>
		<tr>
			<th style="display:none;">num</th>
			<th>순위</th>
			<th id="sj_i">아이디</th>
			<th id="sj_l">길이</th>
			<th>등록일</th>
		</tr>
			<c:forEach var ="rank" items="${list }">
			<%-- <c:if items="${rank.reg_date < rank.reg_date +1 }">	 --%>
			<tr>
				<th style="display:none;">${rank.num }</th>
				<td>${startNum }등</td> 
				<td id="sj_i"><a href = 'sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}&real_name=${rank.real_name}'>${rank.id }/${rank.get_fish }</a></td>
				<%-- <td><a href = 'sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}&real_name=${rank.real_name}'>${id }/${rank.get_fish }</a></td>--%>
				<td>${rank.length }cm<div style="width:${rank.length *2}%;" class="box1"></div></td>
				<td>${rank.reg_date }</td>				
			</tr>
			<%-- </c:if> --%>
			<c:set var="startNum" value="${startNum + 1 }"></c:set>	
			</c:forEach>
	</table>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>