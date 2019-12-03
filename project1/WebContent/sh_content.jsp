<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bootstrap.css">

<style>
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


/* 게시판 read */
#board_read {
	width:900px;
	position: relative;
	word-break:break-all;
}
#user_info {
	font-size:14px;
}
#user_info ul li {
	float:left;
	margin-left:10px;
}
#bo_line {
	width:880px;
	height:2px;
	background: gray;
	margin-top:20px;
}
#bo_line2{

width:880px;
	height:2px;
	background: gray;
	margin-top:150px;

}
#bo_content {
	margin-top:30px;
	font-size: 16px;
} 
#bo_ser {
	font-size:14px;
	color:#333;
	position: absolute;
	right: 0;
}
#bo_ser > ul > li {
	float:left;
	margin-left:10px;
}

/* 댓글 처리*/
.reply_view {
	width:900px;
	margin-top:100px; 
	word-break:break-all;
}
/* 댓글 창 ui*/

/*작성자 내용*/
.dap_lo {
	font-size: 20px;
	padding:10px 0 15px 0;
	border-top: solid 1px gray;
}
/* 댓글 작성자 내용간의 간격 */
.dap_to {
	margin-top:5px;
}

/* 삭제 날짜 폰트 사이즈*/
.rep_me {
	font-size:15px;
	
}
.rep_me ul li {
	float:left;
	width: 30px;
	
}
.dat_edit {
	display:none;
}
.dap_sm {
	position: absolute;
	top: 10px;
}
.dap_edit_t{
	width:520px;
	height:70px;
	position: absolute;
	top: 40px;
}
.re_mo_bt {
	position: absolute;
	top:40px;
	right: 5px;
	width: 90px;
	height: 72px;
}
#re_content {
	width:700px;
	height: 56px; 
	
}
.dap_ins {
	margin-top:50px;
}

/* 댓글 버튼 */
.re_bt {
	position: absolute;
	width:100px;
	height:56px;
	font-size:16px;
	margin-left: 10px; 
}
#foot_box {
	height: 50px; 
}

#rep_delete{
	height: 28px;
	border-bottom: solid 1px gray;
}

</style>
</head>

<body>
<header>
<jsp:include page="header.jsp"></jsp:include> 
</header>



 

<div id="board_read">
	<h2>
	<c:if test="${board.b_head == 1}">[공지사항]</c:if> 
	<c:if test="${board.b_head == 2}">[자유]</c:if> 
	<c:if test="${board.b_head == 3}">[팁]</c:if>
	${board.b_title}</h2>
		<div id="user-info">
			&nbsp; 작성자:&nbsp; ${board.b_id} &nbsp; ${board.b_date} &nbsp; 조회:${board.b_readcount}
			<div id="bo_line"></div>
		</div>
		<div id="bo_content">
		
		 ${board.b_content}
		
		</div>
		<div id="bo_line2">
		</div>
		

<!-- 목록,수정,삭제 -->
	<div id="bo_ser">
		<ul>
		
			<c:if test="${sessionScope.id == board.b_id}">
					<br><br><input type="button" value="수정"
						onclick="location.href='sh_boardUpdateForm.do?b_num=${board.b_num}&pageNum=${pageNum}'">
					 </c:if>
					 
					 <c:if test = "${sessionScope.id == board.b_id  or sessionScope.adminResult eq 1}">
					<input type="button" value="삭제"  
						onclick="deleteContent('${board.b_num}', '${pageNum}')">
					
					 </c:if>
					
				<input type="button" value="목록" onclick="location.href='sh_board.do?pageNum=${pageNum}'">   
			
		</ul>
	</div>
</div>



<!--  댓글   -->	

<form action="sh_content.do?b_num=${board.b_num}&pageNum=${pageNum}&status=1" method="post">
<input type="hidden" value="${ sessionScope.id}" name = "rel">
		


<div class="reply_view">

<!-- 댓글 입력 폼 -->
<div class="dap_ins">
<div style="margin-top:10px;">
<textarea name="reply_content" class="reply_content"
	id="re_content"></textarea>
<c:if test = "${sessionScope.result eq 1 }">
<button type="submit" id="req_bt" class="re_bt">댓글</button>		
</c:if>
</div>
</div>

<h3>댓글목록</h3>

<!--  본문 내용 -->
	<div class="dap_lo">
	<c:forEach var="reply" items="${reply }">
	<div>${reply.comment_id }</div>
	<div class="dap_to comt_edit">${reply.comment_content}</div>
	<div class="rep_me dap_to">	${reply.comment_date}</div>
	<div class="rep_me rep_menu">
<!--  댓글 삭제 누를때 스크립트로 이동 -->
	<div id = "rep_delete">
	<c:if test = "${sessionScope.id == reply.comment_id or sessionScope.adminResult eq 1 }">
	<a href="javascript:deleteReply('${reply.comment_num}','${board.b_num}','${pageNum}')">[삭제]</a>
	</c:if>
</div>
</div>
</c:forEach>
</div>
</div>
</form>	
</body>
</html>


<script>

//게시글 삭제 바로 삭제 가능함. pro안탐
	function deleteContent(b_num, pageNum){
		if( confirm("삭제하시겠습니까?")){
			location.href = "sh_boardDeleteForm.do?b_num=" + b_num + "&pageNum=" + pageNum;		
		}
	}


//댓글 삭제 바로 삭제 가능.
	function deleteReply(comment_num, b_num, pageNum){
		if( confirm("삭제하시겠습니까?")){
			location.href = "sh_commentDelete.do?reply_num=" + comment_num + "&b_num=" + b_num + "&pageNum=" + pageNum + "&status=0";		
		}
	}
	

</script>


