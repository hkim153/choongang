<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Dokdo&display=swap"
	rel="stylesheet">
<link href="test.css" rel="stylesheet" type="text/css">
<style>

#hsd h1{
	font-size: 50px;
	font-family: 'Dokdo', cursive;
	font-weight: bold;
}
#hsd {
	width: 1400px;
	margin: 0 auto;
	text-align: center;
	font-size: 9pt;
}

img.absolute {
	position: absolute;
	left: 500px;
	top: 600px;
}

#imgdiv{
	height:1400px;
	margin-top: 300px;
}

.map1 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 700px;
	top: 400px;
}

.map2 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 500px;
	top: 500px;
}

.map3 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 300px;
	top: 500px;
}

.map4 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 900px;
	top: 400px;
}

.map5 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 400px;
	top: 700px;
}

.map6 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 1050px;
	top: 600px;
}

.map7 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 400px;
	top: 900px;
}

.map8 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 450px;
	top: 1100px;
}

.map9 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 400px;
	top: 1300px;
}

.map10 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 400px;
	top: 1500px;
}

.map11 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 800px;
	top: 1450px;
}

.map12 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 1100px;
	top: 800px;
}

.map13 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 1000px;
	top: 1450px;
}

.map14 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 1150px;
	top: 1000px;
}

.map15 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 1150px;
	top: 1200px;
}

.map16 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 1200px;
	top: 1450px;
}

.map17 {
	width: 150px;
	height: auto;
	border-style: solid;
	background-color: #e8ffff;
	border-color:#99e7ff;
	text-align: center;
	padding: 10px;
	position: absolute;
	left: 600px;
	top: 1660px;
}


</style>
</head>
<body>
	<header> <jsp:include page="header.jsp"></jsp:include> </header>
	<div id="hsd">
		<h1>추천 지역</h1>
		<hr>
		<!-- 우리나라 지도 표시  -->
		<div id="imgdiv">
			<img src="images/map.jpg" alt="우리나라 구역" class="absolute">
		</div>
		<p>
		<!-- 17개 구역을 체크하기 위해서 먼저 17개 변수를 다 0으로 설정한 후에 추천 지역이 있다면 해당 변수만 1로 변경 -->
			<c:set var="reg1" value="0" />
			<c:set var="reg2" value="0" />
			<c:set var="reg3" value="0" />
			<c:set var="reg4" value="0" />
			<c:set var="reg5" value="0" />
			<c:set var="reg6" value="0" />
			<c:set var="reg7" value="0" />
			<c:set var="reg8" value="0" />
			<c:set var="reg9" value="0" />
			<c:set var="reg10" value="0" />
			<c:set var="reg11" value="0" />
			<c:set var="reg12" value="0" />
			<c:set var="reg13" value="0" />
			<c:set var="reg14" value="0" />
			<c:set var="reg15" value="0" />
			<c:set var="reg16" value="0" />
			<c:set var="reg17" value="0" />
			<c:forEach var="fslist" items="${fslist }">
				<c:choose>
					<c:when test="${fslist.getFs_reg() == '경기도' && reg1 == '0'}">
						<c:set var="reg1" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '서울특별시' && reg2 == '0' }">
						<c:set var="reg2" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '인천광역시' && reg3 == '0' }">
						<c:set var="reg3" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '강원도' && reg4 == '0' }">
						<c:set var="reg4" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '충청남도' && reg5 == '0' }">
						<c:set var="reg5" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '충청북도' && reg6 == '0'}">
						<c:set var="reg6" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '세종특별자치시' && reg7 == '0'}">
						<c:set var="reg7" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '대전광역시' && reg8 == '0'}">
						<c:set var="reg8" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '전라북도' && reg9 == '0'}">
						<c:set var="reg9" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '전라남도' && reg10 == '0'}">
						<c:set var="reg10" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '광주광역시' && reg11 == '0'}">
						<c:set var="reg11" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '경상북도' && reg12 == '0'}">
						<c:set var="reg12" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '경상남도' && reg13 == '0'}">
						<c:set var="reg13" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '대구광역시' && reg14 == '0'}">
						<c:set var="reg14" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '울산광역시' && reg15 == '0'}">
						<c:set var="reg15" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '부산광역시' && reg16 == '0'}">
						<c:set var="reg16" value="1" />
					</c:when>
					<c:when test="${fslist.getFs_reg() == '제주특별자치도' && reg17 == '0'}">
						<c:set var="reg17" value="1" />
					</c:when>
				</c:choose>
			</c:forEach>
			<!-- 만약 추천 지역이 있다면 변수가 1로 변했기 때문에,
				 1로 변경된 부분만 박스를 만들고 낚시터 정보를 가져오면 된다 -->
			<c:if test="${reg1 == '1' }">
				<div class="map1">
					<b>경기도</b>
					<hr>
					<ul>
						<!-- 예를들어 추천낚시터에 해당하는 어종도 같고 경기도에 있다면 
							경기도 박스만 일단 만들고 그 박스안에 낚시터 정보 가져옴 -->
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '경기도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg2 == '1' }">
				<div class="map2">
					<b>서울특별시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '서울특별시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg3 == '1' }">
				<div class="map3">
					<b>인천광역시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '인천광역시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg4 == '1' }">
				<div class="map4">
					<b>강원도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '강원도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg5 == '1' }">
				<div class="map5">
					<b>충청남도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '충청남도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg6 == '1' }">
				<div class="map6">
					<b>충청북도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '충청북도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg7 == '1' }">
				<div class="map7">
					<b>세종특별자치시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '세종특별자치시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg8 == '1' }">
				<div class="map8">
					<b>대전광역시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '대전광역시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg9 == '1' }">
				<div class="map9">
					<b>전라북도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '전라북도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg10 == '1' }">
				<div class="map10">
					<b>전라남도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '전라남도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg11 == '1' }">
				<div class="map11">
					<b>광주광역시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '광주광역시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg12 == '1' }">
				<div class="map12">
					<b>경상북도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '경상북도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg13 == '1' }">
				<div class="map13">
					<b>경상남도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '경상남도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg14 == '1' }">
				<div class="map14">
					<b>대구광역시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '대구광역시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg15 == '1' }">
				<div class="map15">
					<b>울산광역시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '울산광역시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg16 == '1' }">
				<div class="map16">
					<b>부산광역시</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '부산광역시'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${reg17 == '1' }">
				<div class="map17">
					<b>제주특별자치도</b>
					<hr>
					<ul>
						<c:forEach var="fslist" items="${fslist }">
							<c:choose>
								<c:when test="${fslist.getFs_reg() == '제주특별자치도'}">
									<li><a
										href='hs_content.do?num=${fslist.getFs_num()}&pageNum=1'>
											${fslist.getFs_name() }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
	</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>