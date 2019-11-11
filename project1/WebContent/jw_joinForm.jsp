<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="join.css" rel="stylesheet" type="">
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 일치하지 않습니땅!");
			frm.passwd.focus();w
			return false;
		}
		return true;
	}
	function winop() {
		/* if (!frm.id.value) {
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		} */
		window.open("jw_confirmIdPro.do?id=${id}" + frm.id.value, "",
				"width=300 height=300");
	}
</script>
</head>
<body>
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		
		<form action="jw_joinPro.do" method="post" name="frm"	onsubmit="return chk()" id="join_form">
			<div id="container1" role="main">
				<div id="content">
					<div class="join_content">
						<div class="row_group">
							<div class="join_row">
							
								<h3 class="join_title">
									<label for="id">아이디</label>
								</h3>
								<span class="ps_box int_id"> 
								<input type="text" name="id"	required="required" id="id" class="int" title="ID"
									maxlength="20">
								</span> <input type="submit" value="중복확인" onclick="winop()"
									required="required" style="height: 29px; font-size: 15px">
							</div>

							<h3 class="join_title">
								<label for="id">암호</label>
							</h3>
							<span class="ps_box int_id"> <input type="password"
								name="passwd" class="int" required="required">
							</span>
							
							<h3 class="join_title">
								<label for="id">암호확인</label>
							</h3>
							<span class="ps_box int_id"> <input type="password"
								name="passwd2" required="required" class="int">
							</span>
							
							<h3 class="join_title">
								<label for="id">이름</label>
							</h3>
							<span class="ps_box int_id"> 
							<input type="text" name="name" required="required" class="int">
							</span>
							
							<h3 class="join_title"><label for="id"> E-Mail </label></h3>
							<span class="ps_box int_id">
							 <input type="text" name="email" required="required" class="int">
							</span>
							
							<h3 class="join_title"><label for="id">주소</label></h3>
							<span class="ps_box int_id">
							 <input type="text" name="address" required="required" class="int">
							</span>
							
							<h3 class="join_title"><label for="id">	전화번호 </label></h3>
							<span class="ps_box int_id">
							 <input type="tel" name="tel" required="required" class="int"
								patten="\d{2,3}-\d{3-4}-\d{4}" placeholder="xxx-xxxx-xxxx"
								title="2,3자리-3,4자리-4자리" style="font-size: ">
								</span>
								
								 <input type="submit" value="확인" style="height: 29px; font-size: 15px">
							<input type="reset" value="취소" onclick="location.href='main.do'" style="height: 29px; font-size: 15px"> 
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