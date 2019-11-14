<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="join.css" rel="stylesheet" type="">
<script type="text/javascript">
	function chk() {
		if(frm.idChkVal.value !="1"){
			alert("2.아이디중복체크를해주세요");
			return false;
	   }

		return true;
	}

	function inputIdChk() { //중복체크하고난뒤 아이디를 재입력시 다시 중복체크하도록 하는 기능
		document.frm.idDuplication.value = "idUncheck";
	}

	function winop() {
		/* if (!frm.id.value) {
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		} */
		window.name = "parentForm";
		window.open("jw_confirmIdPro.do?id=${id}" + frm.id.value, "chkForm",
				"width=510 height=510");
	}
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#idChk').click(function() {
			var id = $('#id').val();
			var sendData = 'id=' + id;
			var msgTrim = "";
			frm.idChkVal.value="1";
			$.post('nameCheckAjax.jsp', sendData, function(msg) {
				// 양쪽 Trim 제거
			    msgTrim = msg.replace(/(^\s*)|(\s*$)/g, "") ;
			    /* alert("msgTrim-->"+msgTrim) */
				if (msgTrim == "1") {
			     	$('#msg').html("이미 사용중인 아이디입니땅!");
					frm.idChkVal.value="0";  // 초기화를 해야만 새로운 아이디 입력시 중복체크여부 확인
				} else {
			     	$('#msg').html("사용할수있는 아이디입니땅!");
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<form action="jw_joinPro.do" method="post" name="frm"			onsubmit="return chk()" id="join_form">
			<input type="hidden"  id="idChkVal" name="idChkVal"  value="0" >
			<div id="container1" role="main">
				<div id="content">
					<div class="join_content">
						<div class="row_group">
							<div class="join_row">
								<h1>회원가입</h1>
								<h3 class="join_title">
									<label for="id">아이디</label>
								</h3>
								<span class="ps_box int_id"> <input type="text" name="id"
									required="required" id="id" class="int" title="ID"
									maxlength="20">
								</span> 
		
							    <input type="button" id="idChk" name="idChk" value="ID Check"  style="height: 29px; width:120px; font-size: 15px"> 
								<span id="msg"></span>		<p>
									<!-- <input type="hidden" name="idDuplication" value="idUncheck"> -->
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
							<span class="ps_box int_id"> <input type="text"
								name="name" required="required" class="int">
							</span>

							<h3 class="join_title">
								<label for="id"> E-Mail </label>
							</h3>
							<span class="ps_box int_id"> <input type="text"
								name="email" required="required" class="int">
							</span>

							<h3 class="join_title">
								<label for="id">주소</label>
							</h3>
							<span class="ps_box int_id"> <input type="text"
								name="address" required="required" class="int">
							</span>

							<h3 class="join_title">
								<label for="id"> 전화번호 </label>
							</h3>
							<span class="ps_box int_id"> <input type="tel" name="tel"
								required="required" class="int" patten="\d{2,3}-\d{3-4}-\d{4}"
								placeholder="xxx-xxxx-xxxx" title="2,3자리-3,4자리-4자리"
								style="font-size:">
							</span> <input type="submit" value="확인"
								style="height: 29px; font-size: 15px"> <input
								type="reset" value="취소" onclick="location.href='main.do'"
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