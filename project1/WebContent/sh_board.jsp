<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="test.css" rel="stylesheet" type="text/css">

<style type="text/css">

/*전체 옵션 */
* {
	margin: 0 auto;
	padding: 0;
	font-family: 'Malgun gothic','Sans-Serif','Arial';
	
}
a{
	text-decoration: none;
	color: #333;
}
ul li{
	list-style:none;
}

/*공통*/
.fl{
	float:left;
}
.tc{
	text-align:center;
}

/*게시판 목록*/
#board_area{
	width: 1100px;
	position: relative;
}
.list-table{
	margin-top: 40px;
}
.list-table thead th{
	height:40px;
	border-top:2px solid #09C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 17px;
}
.list-table tbody td{
	text-align:center;
	padding:10px 0;
	border-bottom:1px solid #CCC; height:20px;
	font-size: 14px
}
#write_btn{

	
	position: absolute; 
	margin-top:20px;
	right: 0;
}





</style>

</head>
<body>
	<div id="warp">
	 <header> <jsp:include page="header.jsp"></jsp:include> </header>
	<div id="board_area">
	
	<p><h1>게시판</h1>
	<h4>자유롭게 글을 쓰는 게시판입니다.</h4>
	<table class="list-table">
		<thead>
		<tr>
			<th width="70">번호</th>
			<th>말머리</th>
			<th width="120">제목</th>
			<th width="100">작성자</th>
			<th width="100">등록일</th>
			<th width="100">조회수</th>
		</tr>
		<tbody>
		<!-- 리스트가 0개이상 있을때 보여주기 -->
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
			
				<tr>
					<td width="70">${startNum }</td>
					<td width="100">
						
						<c:if test="${board.b_head==1}"><div style="color:red">[공지사항]</div></c:if>
						<c:if test="${board.b_head==2}">[자유]</c:if>
						<c:if test="${board.b_head==3}">[팁]</c:if>
					</td>
					
					<c:if test="${board.b_head==1}"><td width="400" ><a style="color:red"
						href="sh_content.do?b_num=${board.b_num}&pageNum=${currentPage}&status=0">
							${board.b_title}</a></td></c:if>
					<c:if test="${board.b_head!=1}"><td width="400"><a
						href="sh_content.do?b_num=${board.b_num}&pageNum=${currentPage}&status=0">
							${board.b_title}</a></td></c:if>
					<td width="500">${board.b_id}</td>
					<td width="100">${board.b_date}</td>
					<td width="100">${board.b_readcount}</td>
				</tr>
				
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		</tbody>
		
			<!-- 게시된 글이 없을때  -->
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div id="write_btn">
	<!--  회원 가입된 인원만 글쓰기가 보임 -->
	<c:if test="${sessionScope.result eq 1 }">
		<td><a href="sh_boardWriteForm.do?pageNum=${pageNum}"><input type="button" value="글쓰기"></a></td>
	</c:if>
</div>

	
	<!--  검색 창  -->
	
	<form method="get" action="sh_board.do">
		<div id ="sarchtype"> 			
			<br><br><select name="searchType">					<!-- 아무것도 안 쳤을때 모든 리스트 보이기 -->
				<option value="01" <c:if test="${empty searchType or searchType eq 01}">selected="selected"</c:if>>제목</option>
				<option value="02" <c:if test="${searchType eq 02}">selected="selected"</c:if>>제목+내용</option>
				<option value="03" <c:if test="${searchType eq 03}">selected="selected"</c:if>>작성자</option>
			</select>
			<input type="text" name="searchText" placeholder="검색어 입력" value="${searchText}">
			<input type="submit" value="검색">
		</div>	
	</form>
	</div>
	
 <!--  페이징 처리  -->
	<div style="text-align: center; margin-bottom: 20px;">
		<c:if test="${startPage > blockSize }">
			<a href='sh_board.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='sh_board.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='sh_board.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
	<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	


</body>
</html>