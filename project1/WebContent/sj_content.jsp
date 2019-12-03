<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style type="text/css">
tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.thcell {
	padding: 32px 31px 32px;
	font-size: 14px;
	line-height: 16px;
}

.tdcell {
	padding: 20px 0 32px 30px;
	vertical-align: text-top;
}

.contxt_tit {
	font-size: 14px;
	line-height: 16px;
	color: #333;
	vertical-align: top;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

.tbl_model {
	position: relative;
	width: 800px;
	table-layout: fixed;
	border-spacing: 0;
	border-collapse: collapse;
	word-wrap: break-word;
	word-break: keep-all;
	border: 0;
	border-bottom: 1px solid #e5e5e5;
}

fieldset {
	display: block;
	margin-inline-start: 2px;
	margin-inline-end: 2px;
	padding-block-start: 0.35em;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
}

#content {
	position: relative;
	padding: 32px 51px 95px;
	margin-left: 25%;
}

body {
	font-family: Dotum, sans-serif;
	font-size: 12px;
}

th {
	display: table-cell;
	font-weight: bold;
	width: 200px;
}

div {
	display: block;
}

.tbl_model th {
	color: #333;
	border-right: 1px solid #e5e5e5;
	background: #f9f9f9;
}

.tbl_model td, .tbl_model th {
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	letter-spacing: 1px;
	border: 0;
	border-top: 1px solid #e5e5e5;
}

#h2 {
	font-size: 30px;
}

#rr {
	width: 40px;
}
.loginBtn5{
	position: relative;
	height: 30px;	
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div>
			<header> <jsp:include page="header.jsp"></jsp:include> </header>
		</div>
		<fieldset>
			<div id="content">
				<table class="tbl_model">
					<caption>
						<h2 id="h2">Registration</h2>
					</caption>
					<tbody>
						<tr>
							<th scope="row">
								<div class="thcell">아이디</div>
							</th>
							<td>
								<div class="tdcell">
									<p class="contxt_tit">${rank.id }</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">물고기</div>
							</th>
							<td>
								<div class="tdcell">
									<p class="contxt_tit">${rank.get_fish }</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">물고기길이</div>
							</th>
							<td>
								<div class="tdcell">
									<p class="contxt_tit">${rank.length }cm</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">사진</div>
							</th>
							<td>
								<div class="tdcell">
									<p class="contxt_tit">
										<!-- real path에 저장된 이미지 띄우기 -->
										<img
											src="${pageContext.request.contextPath}/${img_folder }/${rank.real_name }" width="400" height="250">
									</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">작성일</div>
							</th>
							<td>
								<div class="tdcell">
									<p class="contxt_tit">${rank.reg_date }</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">내용</div>
							</th>
							<td>
								<div class="tdcell">
									<p class="contxt_tit">${rank.content }</p>
								</div>
							</td>
						</tr>
					</tbody>
					<div>
						<input type="button" value="뒤로가기" class="loginBtn5" onclick="history.back(-1)">
					</div>
					<c:choose>  	
			<c:when
				test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
				
				<table>
					<tr> 
						<div style="margin-left:30%;">
						<input type="button" value="삭제" class="loginBtn5"
							onclick="location.href='sj_deleteform.do?num=${num}&id=${id }'">
						</div>
					</tr>
				</table>
			</c:when> 	
			<c:when test="${sessionScope.result eq 1 }">
				<c:if test="${sessionScope.id == rank.id }">
					<table style="margin-left: 15px;">
						<tr>
						<div style="margin-left:30%;">
							<input type="button" value="삭제" class="loginBtn5"
								onclick="location.href='sj_deleteform.do?num=${num}&id=${id }'">
						</div>
						</tr>
					</table>
				</c:if>
			</c:when>
		</c:choose><!-- 1. 로그인,어드민인 경우 삭제 버튼이 나타남 --><!-- 2. 로그인을 하고 작성한 아이디와 로그인한 아이디가 일치할 경우에만 삭제 버튼이 나타남 -->
				</table>
			</div>
		</fieldset>
		<br>		
					<!-- 로그인 안 한경우  -->
		<c:if test="${sessionScope.result ne 1 }">
		</c:if>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>