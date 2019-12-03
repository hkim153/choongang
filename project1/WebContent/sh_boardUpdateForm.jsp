<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
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
	margin-top: 10px;
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
 



</head>
<body>

<header>
	<jsp:include page="header.jsp"></jsp:include> 
</header>

<form action="sh_boardUpdatePro.do" method="post">
		
  		<!-- <div id="contentForm"> -->
		<input type="hidden" name="b_num" value="${board.b_num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
	
		<div id="board_write">
		<h1>게시판</h1>		
		<div id="write-area">
				
				
				
			<div id="in_name">
				말머리:	
				<c:if test="${board.b_head == 1}">[공지사항]</c:if>
				<c:if test="${board.b_head == 2}">[자유]</c:if>
				<c:if test="${board.b_head == 3}">[팁]</c:if>
				
			</div>	
				<div id="in_title">
					
				<textarea  name="b_title" id="utitle" rows="1" cols="55"
				 maxlength="100" required="required"> ${board.b_title}</textarea>
				
				</div>
				<div class="wi_line"></div>
				 <div id="in_name">${board.b_id}</div>
			
			
				<div class="wi_line"></div>
		
				<div id="in_content">
				<textarea name="b_content" id="ucontent" required="required"> ${board.b_content}</textarea>
				</div>
				
			<div class="bt_se">
				<button type="submit">수정하기</button>
				<button type="button"
						onclick="location.href='sh_board.do?pageNum=${pageNum}'">취소</button>
	</div>
</div>
 </form>
				
</script>
</body>
</html>