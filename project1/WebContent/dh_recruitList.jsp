<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
</head>
<body>
 <div class="wrap">
<header> <jsp:include page="header.jsp"></jsp:include> </header>
	<h2>인원 모집 게시판</h2>
	<table>
		<tr>
			<td><a href="dh_recruit.do">모집하기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<<th>방번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
		
		<c:if test="${totCnt > 0 }">
		<c:forEach var="recruit" items="${list }">
				<tr>
					<td>${recruit.recruit_num }</td>
					<td class="left" width=200>
						 <a href='dh_recruit_content.do?recruit_num=${recruit.recruit_num }'>
							${recruit.recruit_title}</a>
					</td>
					<td>${recruit.id}</td>
					<td>${recruit.reg_date}</td>
							<c:choose>
								<c:when
									test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
									<!-- 로그인값, 어드민권한 둘다 있을때  -->
									<td><input type="button" value="삭제"
										onclick="location.href='dh_deletePro.do?recruit_num=${recruit.recruit_num}'"></td>
								</c:when>
							</c:choose>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center; margin:20px auto;">
		<c:if test="${startPage > blockSize }">
			<a href= 'dh_recruitList.do?pageNum=${startPage-blockSize }'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href='dh_recruitList.do?pageNum=${i }'>[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='dh_recruitList.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if>
	</div>

	
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>