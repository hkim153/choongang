<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>

table.type05{
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
    line-height: 1.5;
    border-top: 1px solid #D5D5D5;
    margin: 20px 10px;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #D5D5D5;
    background: #D4F4FA
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #D5D5D5;
}
#board_write {
	width: 600px;
	position: relative;
	margin: 0 auto;
}

#write_area {
	margin-top: 70px;
	font-size: 14px;
}


</style>
</head>
<body>
	<div class="wrap">
	<%-- <c:if test="${sessionScope.result ne 1 }">
				<script type="text/javascript">
					alert("로그인 해주세요");
					location.href = "jw_loginForm.do";
				</script>
			</c:if> --%>
			<div> <jsp:include page="header.jsp"></jsp:include> </div>
			<div id="board_write">
				<h2>모집 상세내역</h2>
			<div id="wirte_area">
	<table class="type05">
		<tr>
			<th scope="row">번호</th>
			<td>${recruit.recruit_num}</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td>${recruit.recruit_title}</td>
		</tr>
		<tr>
			<th scope="row">작성자</th>
			<td>${recruit.id}</td>
		</tr>
		<tr>
			<th scope="row">목표어종</th>
			<td>${recruit.recruit_species}</td>
		</tr>
		<tr>
			<th scope="row">목표어획량</th>
			<td>${recruit.recruit_goal}</td>
		</tr>
		<tr>
			<th scope="row">어획시간</th>
			<td><pre>${recruit.recruit_timeset}</td>
		</tr>
		<tr>
			<th scope="row">모집인원</th>
			<td><pre>${recruit.recruit_member}</td>
		</tr>
		<tr>
			<th scope="row">출항날짜</th>
			<td><pre>${recruit.recruit_event}</td>
		</tr>
		<tr>
			<th scope="row">작성일</th>
			<td>${recruit.reg_date}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="채팅방입장"
				onclick="location.href='dh_recruit_chat_In.do?recruit_num=${recruit.recruit_num }&room_manager=${recruit.id}'">
				<c:if test="${sessionScope.id == recruit.id}">
				
				<input type="button" value="수정"
						onclick="location.href='dh_updateform.do?recruit_num=${recruit.recruit_num }'">
					<input type="button" value="삭제"
						onclick="location.href='dh_deleteForm.do?recruit_num=${recruit.recruit_num }'">
				</c:if> <input type="button" value="목록"
				onclick="location.href='dh_recruitList.do'"></td>
			 
			</tr>
		
	</table>
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>