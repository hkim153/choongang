<%@page import="dao.fishingsite"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.map{
		width: 200px;
		height: auto;
		border-style:solid;
	}
</style>
<script type="text/javascript">
	
</script>

</head>
<body>
<h1> 추천 지역 </h1>
<hr>
<figure>
<img src = "images/map.jpg" alt = "우리나라 구역" usemap = "#koreamap"><p>
<c:set 
<c:forEach var = "fslist" items = "${fslist }">
	이름 : ${fslist.getFs_name() }
	지역 : ${fslist.getFs_reg() }
	<c:choose>
		<c:when test="${fslist.getFs_reg() == '경기도' }">
				<div class = "map">
					${fslist.getFs_name() }
				</div>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '서울특별시' }">
		
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '인천광역시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '강원도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '충청남도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '충청북도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '경상남도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '경상북도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '세종특별자치시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '대전광역시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '대구광역시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '울산광역시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '전라북도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '전라남도' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '부산광역시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '광주광역시' }">
				
		</c:when>
		<c:when test="${fslist.getFs_reg() == '제주특별자치도' }">
				
		</c:when>
	</c:choose>
</c:forEach>




<figcaption>해당 지역을 클릭하세요</figcaption>

</figure>

</body>
</html>