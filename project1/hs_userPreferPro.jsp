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
		top: 300px;
	}
	.map1{
		position:absolute;
		left: 550px;
		top: 100px;
	}
	.map2{
		position:absolute;
		left: 300px;
		top: 100px;
	}
	.map3{
		position:absolute;
		left: 50px;
		top: 200px;
	}
	.map4{
		position:absolute;
		left: 1000px;
		top: 150px;
	}
	.map5{
		position:absolute;
		left: 50px;
		top: 400px;
	}
	.map6{
		position:absolute;
		left: 1000px;
		top: 350px;
	}
	.map7{
		position:absolute;
		left: 50px;
		top: 600px;
	}
	.map8{
		position:absolute;
		left: 50px;
		top: 800px;
	}
	.map9{
		position:absolute;
		left: 50px;
		top: 1000px;
	}
	.map10{
		position:absolute;
		left: 50px;
		top: 1200px;
	}
	.map11{
		position:absolute;
		left: 50px;
		top: 1400px;
	}
	.map12{
		position:absolute;
		left: 1000px;
		top: 550px;
	}
	.map13{
		position:absolute;
		left: 650px;
		top: 1200px;
	}
	.map14{
		position:absolute;
		left: 1000px;
		top: 750px;
	}
	.map15{
		position:absolute;
		left: 1000px;
		top: 950px;
	}
	.map16{
		position:absolute;
		left: 1000px;
		top: 1150px;
	}
	.map17{
		position:absolute;
		left: 300px;
		top: 1400px;
	}

	#upright{
			position: absolute;
   			top: 0px;
   			right: 0px;
   			border-style:solid;
	}
	

</style>
</head>
<body>
<div id ="upright">
		<a href="main.do">홈으로</a>
		<a href="hs_fishingSiteForm.do">낚시터 홈으로</a>
		<a href="jw_logOut.do">로그아웃하기</a>
</div>

<h1> 추천 지역 </h1>
<hr>
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
	<c:choose>
		<c:when test="${fslist.getFs_reg() == '경기도' && reg1 == '0'}">
				<c:set var="reg1" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '서울특별시' && reg2 == '0' }">
				<c:set var="reg2" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '인천광역시' && reg3 == '0' }">
				<c:set var="reg3" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '강원도' && reg4 == '0' }">
				<c:set var="reg4" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '충청남도' && reg5 == '0' }">
				<c:set var="reg5" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '충청북도' && reg6 == '0'}">
				<c:set var="reg6" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '세종특별자치시' && reg7 == '0'}">
				<c:set var="reg7" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '대전광역시' && reg8 == '0'}">
				<c:set var="reg8" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '전라북도' && reg9 == '0'}">
				<c:set var="reg9" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '전라남도' && reg10 == '0'}">
				<c:set var="reg10" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '광주광역시' && reg11 == '0'}">
				<c:set var="reg11" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '경상북도' && reg12 == '0'}">
				<c:set var="reg12" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '경상남도' && reg13 == '0'}">
				<c:set var="reg13" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '대구광역시' && reg14 == '0'}">
				<c:set var="reg14" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '울산광역시' && reg15 == '0'}">
				<c:set var="reg15" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '부산광역시' && reg16 == '0'}">
				<c:set var="reg16" value = "1"/>
		</c:when>
		<c:when test="${fslist.getFs_reg() == '제주특별자치도' && reg17 == '0'}">
				<c:set var="reg17" value = "1"/>
		</c:when>
	</c:choose>
</c:forEach>
<c:if test="${reg1 == '1' }">
<div class = "map1">
	<b>경기도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '경기도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg2 == '1' }">
<div class = "map2">
	<b>서울특별시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '서울특별시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg3 == '1' }">
<div class = "map3">
	<b>인천광역시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '인천광역시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg4 == '1' }">
<div class = "map4">
	<b>강원도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '강원도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg5 == '1' }">
<div class = "map5">
	<b>충청남도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '충청남도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg6 == '1' }">
<div class = "map6">
	<b>충청북도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '충청북도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg7 == '1' }">
<div class = "map7">
	<b>세종특별자치시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '세종특별자치시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg8 == '1' }">
<div class = "map8">
	<b>대전광역시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '대전광역시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg9 == '1' }">
<div class = "map9">
	<b>전라북도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '전라북도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg10 == '1' }">
<div class = "map10">
	<b>전라남도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '전라남도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg11 == '1' }">
<div class = "map11">
	<b>광주광역시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '광주광역시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg12 == '1' }">
<div class = "map12">
	<b>경상북도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '경상북도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg13 == '1' }">
<div class = "map13">
	<b>경상남도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '경상남도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg14 == '1' }">
<div class = "map14">
	<b>대구광역시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '대구광역시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg15 == '1' }">
<div class = "map15">
	<b>울산광역시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '울산광역시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg16 == '1' }">
<div class = "map16">
	<b>부산광역시</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '부산광역시'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${reg17 == '1' }">
<div class = "map17">
	<b>제주특별자치도</b>
	<hr>
	<ul>
		<c:forEach var = "fslist" items = "${fslist }">
			<c:choose>
				<c:when test="${fslist.getFs_reg() == '제주특별자치도'}">
					<li><a href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
							${fslist.getFs_name() }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
</c:if>




</body>
</html>