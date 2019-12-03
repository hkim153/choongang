<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="join.css" rel="stylesheet" type="">
<style type="text/css">
.wrap {
	height: 1000px;
}

#h1 {
	text-align: center;
	font-size: 30px;
	font-family: 'Dokdo', cursive;
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
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<h1 id="h1">Regist</h1>
		<form action="sj_regpro.do?id=${id }" enctype="multipart/form-data"
			method="post" id="join_form">
			<div id="container1" role="main">
				<div id="content">
					<div class="join_content">
						<div class="row_group">
							<div class="join_row">

								<h3 class="join_title">
									<label for="id">아이디</label>
								</h3>
								<span class="ps_box int_id"> <input type="text" name="id"
									value="${id }" id="id" class="int" title="ID" maxlength="20"
									disabled>
								</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="id">물고기(클릭하시면 선택하실 수 있습니다)</label>
								</h3>
								<span class="ps_box int_id"> <select name="get_fish"
									id="get_fish" class="int">		<!-- 물고기 선택 물고기의 리스트는 fish테이블에서 가져옴  -->
										<c:forEach var="rank4" items="${list3 }">
											<option value="${rank4.f_name }">${rank4.f_name }</option>
										</c:forEach>
								</select>
								</span>
							</div>

							<h3 class="join_title">
								<label for="id"> 물고기 길이 </label>
							</h3>
							<span class="ps_box int_id"> <input type="text"
								name="length" required="required" placeholder="단위는 cm입니다"
								class="int">
							</span>

							<h3 class="join_title">
								<label for="id">사진등록하기</label>
							</h3>
							<span class="ps_box int_id"> <input type="file"
								name="img_folder" required="required" class="int">
							</span>

							<h3 class="join_title">
								<label for="id"> 리뷰 </label>
							</h3>
							<span class="ps_box int_id"> <textarea rows="1" cols="40"
									name="content" required="required" class="int"
									placeholder="물고기를 잡은 기분을 표현해 주세요"></textarea>
							</span> <input type="submit" value="제출" class="loginBtn5"
								style="height: 29px; font-size: 15px"> <input
								type="reset" value="다시 작성" class="loginBtn5" style="height: 29px; font-size: 15px">
							<input type="button" value="뒤로가기" class="loginBtn5" onclick="history.back(-1)"
								style="height: 29px; font-size: 15px">
						</div>
					</div>
				</div>
			</div>


		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>


</body>
</html>