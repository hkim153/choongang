<%@page import="dao.Store"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="test1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>


<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
function selb_code(){
	$('#m_code option').remove(0);
	str = "";
	var bcode = document.getElementById('b_code').value;
	$.ajax({
		url:"ajaxMenu.jsp",
		data:{b_code : bcode},
		dataType:'text',
		success:function(data){
			var list = JSON.parse(data);
			var jsondata = JSON.stringify(data);
				str  += "<option>중분류</option> ";
			$.each(list.list,function() {
				str  += "<option value='" + this.m_code + "'> " + this.m_name  + "</option> "; 			
			});
			$('#m_code').append(str);
		}
	});
};


function selm_code(){
	$('#s_code option').remove(0);
	str = "";
	var bcode = document.getElementById('b_code').value;
	var mcode = document.getElementById('m_code').value;
	$.ajax({
		url:"ajaxMenu2.jsp",
		data:{b_code : bcode, m_code : mcode},
		dataType:'text',
		success:function(data){
			var list = JSON.parse(data);
			var jsondata = JSON.stringify(data);
				str  += "<option>소분류</option> ";
			$.each(list.list,function() {
				str  += "<option value='" + this.s_code + "'> " + this.s_name  + "</option> "; 			
			});
			$('#s_code').append(str);
		}
	});
}

</script>

<% 
List<Store> b_menu = (List<Store>)request.getAttribute("b_menu");
String b_code = (String)request.getAttribute("b_code");
System.out.println("Form.jsp ==>" + b_code);
//
for(int i =0; i<b_menu.size(); i++){
	System.out.println(b_menu.get(i).getB_code()+"||"+b_menu.get(i).getB_name());
	}
if(b_code != "00"){
	List<Store> m_menu = (List<Store>)request.getAttribute("m_menu");
	System.out.println("--------------------");
	for(int i =0; i<m_menu.size(); i++){
		System.out.println(m_menu.get(i).getM_code()+"||"+m_menu.get(i).getM_name());
		}	
}


%>
<style type="text/css">
#pro_button {
	text-align: center
}
</style>
</head>
<body>
	<div id="wrap">
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
	<c:if test = "${sessionScope.result ne 1 }">
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href="jw_loginForm.do";
		</script>
	</c:if>
	<div id="container" style="width: 1080px;">
		<div class="content" style="width:388px; margin:20px auto;">
	<h2>상품등록</h2>
	<hr>
	<form action="wh_ProregistPro.do" enctype="multipart/form-data" method="post">
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>
					<div id="Menu_list"></div>  
					<select id ="b_code" name="b_code" onchange="selb_code()">
						<c:forEach var="bmenu" items="${b_menu}">
							<option value="${bmenu.b_code}">${bmenu.b_name}</option>
						</c:forEach>
					</select>
					<select id ="m_code" name="m_code" onchange="selm_code()">
						<option>중분류</option>
					</select>
					<select id ="s_code" name="s_code">
						<option value="">소분류</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="pro_name" required="required"></td>
			</tr>
			<tr>
				<td>상품상세이미지1</td>
				<td><input type="file" name="pro_contentFile" required="required" ></td>
			</tr> 
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="pro1_imgFile" required="required"></td>
			</tr>
			<tr>
				<td>상품이미지2</td>
				<td><input type="file" name="pro2_imgFile" ></td>
			</tr>
			<tr>
				<td>상품이미지3</td>
				<td><input type="file" name="pro3_imgFile" ></td>
			</tr>
		 	<tr>
				<td>상품이미지4</td>
				<td><input type="file" name="pro4_imgFile" ></td>
			</tr>
			<tr>
				<td>상품이미지5</td>
				<td><input type="file" name="pro5_imgFile" ></td>
			</tr> 
			<tr>
				<td>상품가격</td>
				<td><input type="number" name="price" required="required"></td>
			</tr>
			<tr>
				<td>판매자명</td>
				<td><input type="text" name="seller" value="aa" required="required"></td>
			</tr>
<!-- 			<tr>
				<td>누적판매개수</td>
				<td><input type="number" name="sellcnt" required="required"></td>
			</tr> -->
			<tr>
				<td>재고수</td>
				<td><input type="number" name="stock" required="required"></td>
			</tr>
			<tr>
				<td>원산지</td>
				<td><input type="text" name="origin" required="required"></td>
			</tr>
			<tr>
				<td>재조사</td>
				<td><input type="text" name="pro_made" required="required"></td>
			</tr>
			<tr>
				<td>상품판매상태</td>
				<td><select name="pro_state">
						<option value="1" selected>판매중</option>
						<option value="2">매진</option>
						<option value="3">판매중지</option>
				</select></td>
			</tr>
			<tr>
				<td id="pro_button" colspan="2"><input type="submit"
					value="상품등록"> <input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>