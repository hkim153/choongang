<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style type="text/css">
.sj_box1 {
	height: 30px;
	background: #ff6a00;
	width: 30%;
}

#sj_y {
	min-height: 1000px;
	margin-left: 35%;
}

.sj_b {
	margin-left: -5%;
}

.sj_f {
	min-width: 700px;
}

.sj_d {
	margin-left: -2%;
	font-size: 20px;
}

table {
	border-collapse: collapse;
}

.sj_b tr {
	border-top: 1px groove;
	border-bottom: 1px groove;
}

#sj_l {
	width: relative;
	text-align: center;
}

#sj_i {
	text-align: center;
}

#sj_w {
	width: relative;
}
#loginBtn2 {
	height: 37px;
	width: 190px;	
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
}
#loginBtn3{
	position: relative;
	height: 30px;	
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
}
#h2 {
	font-family: 'Dokdo', cursive;
}
</style>
<script type="text/javascript">
	function ch(num) {
		var get_fish = document.getElementById('get_fish').value;
		location.href = 'fishingking.do?get_fish=' + get_fish;
	}
</script>
</head>
<body>
	<div id="wrap">
		<div>
			<header> <jsp:include page="header.jsp"></jsp:include> </header>
		</div>
		<div id="sj_y">
			<h2> 		<!-- 물고기 선택 물고기의 리스트는 fish테이블에서 가져옴 / 물고기 클릭시 해당 물고기 값 가져와서 해당 물고기 리스트를  뿌림 -->
				<h2 id="h2">보고싶은 물고기를 선택하여 주세요</h2>
				<form action="fishingking.do?get_fish=${rank.get_fish }&id=${id}">
					<select name="get_fish" id="get_fish" onchange="ch(${rank.num })">
						<option selected="selected">물고기선택</option>
						<c:forEach var="rank3" items="${list3 }">
							<option value="${rank3.f_name }">${rank3.f_name }</option>
						</c:forEach>
					</select> 랭킹
				</form>
			</h2>
			<p>		<!-- 로그인한 경우에만 등록 가능  -->
				<c:choose>			
					<c:when test="${sessionScope.result eq 1 }">
						<table class="sj_d">
							<tr>
								<td><input type="button" value="나의 물고기 자랑하기" id="loginBtn2"
									onclick="location.href='sj_regform.do?num=${num}&id=${id }&f_name=${f_name }'"></td>
							</tr>
						</table>
					</c:when>		
					
					<c:when test="${sessionScope.result ne 1 }">
						<h3>로그인을 하시면 등록이 가능합니다</h3>
					</c:when>
				</c:choose><!-- 로그아웃 상태에서 등록가능하다는 메세지 보임 -->
				<br>
				
			<div class="sj_b">		<!-- startNum은 다른 곳에서는 보통 게시글의 순번으로 사용하는데 나는 순위로 사용
									order by 한 이후 startNum을 하기때문에 등수로 사용 가능 -->
				<table class="sj_f">
					<tr>			<!-- num 굳이 안보여도 상관없음  -->
						<th style="display: none;">num</th>
						<th id="sj_i">순위</th>
						<th id="sj_i">아이디</th>
						<th style="width:80px;">어종</th>
						<th id="sj_l">길이</th>
						<th>등록일</th>
						<th style="display: none;">삭제버튼 (안보이게할거)</th>
					</tr>
					<c:forEach var="rank" items="${list }">
						<tr>
							<th style="display: none;">${rank.num }</th>
							<td id="sj_i">${startNum }등</td>
							<td id="sj_i"><a
								href='sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}&real_name=${rank.real_name}'>${rank.id }</a></td>
							<td id="sj_i"><a
								href='sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}&real_name=${rank.real_name}'>${rank.get_fish }</a></td>
							<td id="sj_w">${rank.length }cm<div
									style="width:${rank.length *2}%;" class="sj_box1"></div></td>
							<td id="sj_i"><div>${rank.reg_date }</div></td>
							<c:choose>
								<c:when
									test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
									<!-- 로그인값, 어드민권한 둘다 있을때  -->
									<td><input type="button" value="삭제" id="loginBtn3"
										onclick="location.href='sj_deleteform.do?num=${rank.num}&id=${rank.id }'"></td>
								</c:when>
							</c:choose>
						</tr>
						<c:set var="startNum" value="${startNum + 1 }"></c:set>
					</c:forEach>
				</table>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>