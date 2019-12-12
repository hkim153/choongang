<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css">
<!-- jQuery 기본 js 파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link href="test.css" rel="stylesheet" type="text/css">

<style>
/* 게시판 글쓰기 */
#board_write {
	width: 900px;
	position: relative;
	margin: 0 auto;
}

#write_area {
	margin-top: 70px;
	font-size: 14px;
}

#in_name {
	margin-top: 30px;
}

#in_name textarea {
	font-weight: bold;
	font-size: 26px;
	color: #333;
	width: 900px;
	border: none;
	resize: none;
}

#in_title {
	margin-top: 30px;
}

#in_title textarea {
	font-weight: bold;
	font-size: 26px;
	color: #333;
	width: 900px;
	border: none;
	resize: none;
}

.wi_line {
	border: solid 1px lightgray;
	margin-top: 10px;
}

#in_content {
	font-size: 20px;
	margin-top: 10px;
	text-align : center;
}

#in_content textarea {
	font: 14px;
	color: #333;
	width: 900px;
	height: 400px;
	resize: none;
}

#in_pw input {
	font: 14px;
	margin-top: 10px;
}

.bt_se {
	margin-top: 20px;
	text-align: center;
}

.bt_se button {
	width: 100px;
	height: 30px;
}


</style>

<script type="text/javascript">
$(function () {
	$( "#datepicker" ).datepicker (
	{
		dateFormat: 'yymmdd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,
		changeYear: true,
		showMonthAfterYear: true,
	});
});
</script>
<script type="text/javascript">
	function change_species(){
		var species = '${recruit.recruit_species}';
		var change_species = document.getElementById('Recruit_species').value;
		$(function(){
			document.frm.Recruit_species.value=change_species;
		});
	}
</script>

</head>
<body>
	
		<%-- <c:if test="${sessionScope.result ne 1 }">
				<script type="text/javascript">
					alert("로그인 해주세요");
					location.href = "jw_loginForm.do";
				</script>
			</c:if>  --%>
<header> <jsp:include page="header.jsp"></jsp:include> </header>
 
	
		<form action="dh_updatepro.do" method="post" name="frm">
			<input type="hidden" name="recruit_num" value="${recruit.recruit_num}">
			<input type="hidden" name="recruit_id" value="${recruit.id}">
			<input type="hidden" name="recruit_e_id" value="${recruit.e_id}">
				
				<div id ="board_write">
						<h1>팀원 모집</h1>
				<div id="write-area">
				
				<div id="in_title">
					번호:
					${recruit.recruit_num}
				</div>
				<div class="wi_line"></div>
				
				<div id="in_title">
					제목
				<textarea  name="b_title" id="utitle" rows="1" cols="55"
				 maxlength="100" required="required">${recruit.recruit_title}</textarea>
				</div>
				
				<div class="wi_line"></div>
				 <div id="in_name">
					작성자:
					${recruit.id}
				</div>
				<div class="wi_line"></div>
				<br><div id=writer">
					작성일: 
					${recruit.reg_date}
				</div>
				
				<div class="wi_line"></div>
					
					<div id="in_content">
						목표어종
						<select id="f_species" id ="recruit_species" name="recruit_species" onchange="change_species()">
							<option value="${recruit.recruit_species}"> 현재 목표어종 : ${recruit.recruit_species}</option>
							<optgroup label="----------------------------">
							<c:forEach var="f_species" items="${f_species}">
							<option value="${f_species.f_name}">${f_species.f_name}</option>
							</c:forEach>
							</optgroup>
							</select>
						
							
						<br><br>목표어획량

						<select name="recruit_goal" size="1">
							
							<option value="${recruit.recruit_goal}"> 현재 목표어획량 :${recruit.recruit_goal}</option>
							<optgroup label="----------------------------">
		
							<option value="5마리">5마리</option>
							<option value="10마리">10마리</option>
							<option value="20마리">20마리</option>
							<option value="30마리">30마리</option>
							<option value="50마리">50마리</option>
							</optgroup>
						</select>
				
						<br><br>어획시간
						
						<select name="recruit_timeset" size="1">
							<option value="${recruit.recruit_timeset}"> 현재 목표시간 : ${recruit.recruit_timeset}</option>
								<optgroup label="----------------------------">
							<option value="3시간">3시간</option>
							<option value="6시간">6시간</option>
							<option value="12시간">12시간</option>
							<option value="1일">1일</option>
							<option value="3일">3일</option>
							<option value="일주일">일주일</option>
							</optgroup>
						</select>
			
						<br><br>모집인원	
					
						<select name="recruit_member" size="1">
							<option value="${recruit.recruit_member}"> 현재 목표인원 : ${recruit.recruit_member}명</option>
								<optgroup label="----------------------------">
							<option value="5">5명</option>
							<option value="10">10명</option>
							<option value="20">20명</option>
							<option value="30">30명</option>
							<option value="50">50명</option>
						</select>
				
			
						<br><br>출항날짜
					
							<input type="text" id="datepicker" name="recruit_event" value="${recruit.recruit_event}">
							<%-- <input type="text" id="datepicker" name="Recruit_event" required="required" value="${recruit.recruit_event}"> --%>
					
						<br><br><td colspan="2"><input type="submit" value="수정 완료"></td>
					
					
				
					</div>
					</div>
					<div class="wi_line"></div>
					</div>
		</form>
		<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	
</body>
</html>