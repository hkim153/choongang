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
	div{
		width: 200px;
		height: auto;
		border-style:solid;
	}
	img.absolute{
		position: absolute;
		left: 300px;
		top: 200px;
	}
	.map1{
		position:absolute;
		left: 200px;
		top: 100px;
	}

	#upright{
			position: absolute;
   			top: 0px;
   			right: 0px;
   			border-style:solid;
	}

</style>
<script type="text/javascript">
	
</script>

</head>
<body>

<div id ="upright">
		<a href="main.do">홈으로</a>
		<a href="hs_fishingSiteForm.do">낚시터 홈으로</a>
		<a href="jw_logOut.do">로그아웃하기</a>
</div>

<h1> 추천 지역 </h1>
<hr>
<figure>
<img src = "images/map.jpg" alt = "우리나라 구역" class = "absolute"><p>
<c:set var = "reg1" value = "0"/>
<c:set var = "reg2" value = "0"/>
<c:set var = "reg3" value = "0"/>
<c:set var = "reg4" value = "0"/>
<c:set var = "reg5" value = "0"/>
<c:set var = "reg6" value = "0"/>
<c:set var = "reg7" value = "0"/>
<c:set var = "reg8" value = "0"/>
<c:set var = "reg9" value = "0"/>
<c:set var = "reg10" value = "0"/>
<c:set var = "reg11" value = "0"/>
<c:set var = "reg12" value = "0"/>
<c:set var = "reg13" value = "0"/>
<c:set var = "reg14" value = "0"/>
<c:set var = "reg15" value = "0"/>
<c:set var = "reg16" value = "0"/>
<c:set var = "reg17" value = "0"/>
<c:forEach var = "fslist" items = "${fslist }">
	이름 : ${fslist.getFs_name() }
	지역 : ${fslist.getFs_reg() }
	<c:choose>
		<c:when test="${fslist.getFs_reg() == '경기도' && reg1 == '0'}">
				<div class = "map1">
					<ul>
					</ul>
				</div>
				<c:set var="reg1" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '서울특별시' && reg2 == '0' }">
				<div class = "map2">
					<ul>
					</ul>
				</div>
				<c:set var="reg2" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '인천광역시' && reg3 == '0' }">
				<div class = "map3">
					<ul>
					</ul>
				</div>
				<c:set var="reg3" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '강원도' && reg4 == '0' }">
				<div class = "map4">
					<ul>
					</ul>
				</div>
				<c:set var="reg4" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '충청남도' && reg5 == '0' }">
				<div class = "map5">
					<ul>
					</ul>
				</div>
				<c:set var="reg5" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '충청북도' && reg6 == '0'}">
				<div class = "map6">
					<ul>
					</ul>
				</div>
				<c:set var="reg6" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '경상남도' && reg7 == '0'}">
				<div class = "map7">
					<ul>
					</ul>
				</div>
				<c:set var="reg7" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '경상북도' && reg8 == '0'}">
				<div class = "map8">
					<ul>
					</ul>
				</div>
				<c:set var="reg8" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '세종특별자치시' && reg9 == '0'}">
				<div class = "map9">
					<ul>
					</ul>
				</div>
				<c:set var="reg9" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '대전광역시' && reg10 == '0'}">
				<div class = "map10">
					<ul>
					</ul>
				</div>
				<c:set var="reg10" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '대구광역시' && reg11 == '0'}">
				<div class = "map11">
					<ul>
					</ul>
				</div>
				<c:set var="reg11" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '울산광역시' && reg12 == '0'}">
				<div class = "map12">
					<ul>
					</ul>
				</div>
				<c:set var="reg12" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '전라북도' && reg13 == '0'}">
				<div class = "map13">
					<ul>
					</ul>
				</div>
				<c:set var="reg13" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '전라남도' && reg14 == '0'}">
				<div class = "map14">
					<ul>
					</ul>
				</div>
				<c:set var="reg14" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '부산광역시' && reg15 == '0'}">
				<div class = "map15">
					<ul>
					</ul>
				</div>
				<c:set var="reg15" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '광주광역시' && reg16 == '0'}">
				<div class = "map16">
					<ul>
					</ul>
				</div>
				<c:set var="reg16" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '제주특별자치도' && reg17 == '0'}">
				<div class = "map17">
					<ul>
					</ul>
				</div>
				<c:set var="reg17" value = "1"/>
		</c:when>
	</c:choose>
</c:forEach>




<figcaption>해당 지역을 클릭하세요</figcaption>

</figure>

</body>
</html>