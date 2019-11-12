<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="test.css" rel="stylesheet" type="text/css">
<style type="text/css">
 .container{
 	width:1080px;
 	margin: 0 auto;
 	padding: 8px 10px 0;
 }
 
 .left {
 	float: left;
 	width: 795px;
 	border: 1px solid gray;
 	height:500px;
 }
 
 .right{
 	float: right;
 	width:280px;
 	border: 1px solid gray;
 	height:500px;
 }
 
 .bottom{
 	float: left;
 	width:1080px;
 	border: 1px solid gray;
 	height:150px;
 }
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div>
		
			<jsp:include page="header.jsp"></jsp:include>
		</div>
	<form action="wh_proOrderPro.do" method="post" name="frm">
		<input type="hidden" name="totalPrice" value="${totalPrice}">	
		<input type="hidden" name="quantity" value="${quantity}">
		<input type="hidden" name="pro_name" value="${proContent.pro_name}">
		<input type="hidden" name="seller" value="${proContent.seller}">
		<input type="hidden" name="pro_num" value="${proContent.pro_num}">
		<input type="hidden" name="pro_code" value="${proContent.pro_code}">
		<input type="hidden" name="name" value="${member.name}">
		<div class="container">
			<div>
				<div style="width:100%; padding: 20px 0;">
					<h2 style="float:left;">주문/결제</h2>
					<h5 style="float:right;">주문/결제 <font color="gray"> > 완료</font></h5>
				</div>
				<hr style="width:1080px;">
				<table border="1" style="width:1080px; text-align: center;">
					<tr style="height:60px;">
						<th colspan="2">상품정보</th><th>판매자</th><th>배송비</th><th>수량</th><th>할인</th><th>주문금액</th>
					</tr>
					<tr >
						<td colspan="7" style="background-color: #D4F4FA;" ><strong>많이 많이 구매해주세요.</strong></td>
					</tr> 
					<tr>
						<td>
							<img src="${pageContext.request.contextPath}/${first_img}" style="width: 100px;">
						</td>
						<td>
							${proContent.pro_name}
						</td>
						<td>
							${proContent.seller }
						</td>
						<td>
							무료
						</td>
						<td>
							${quantity}개
						</td>
						<td>
						 -
						</td>
						<td>
							<strong>${totalPrice}원</strong>
						</td>
					</tr>
				</table>
			</div>
			<hr style="width: 1080px; ">
			<div>
				<div class="left">
					<div style="margin-left: 45px; ">
						<h3>배송지 정보</h3>
						<div>
							${member.name}<p>
							<input type="text" name="tel" value="${member.tel}" style="width:95px;"><p>
							<input type="text" name="address" value="${member.address}" style="width:300px;">
						</div>
						<div>
							<span style="font-size: 10px; font-weight: bold; color:gray;">${proContent.pro_name}</span><br> 
							<input type="text" name="request_term" placeholder="요청사항을 직접 입력해주세요." style="width:400px; margin-top: 5px;">
						</div>
					</div>
				</div>
				<div class="right">
					<div style="margin-left: 45px;">
						<h5>주문자 정보</h5>
						${member.name}<p>
						<input type="text" name="tel" value="${member.tel}"><p>
						<input type="email" name="email" value="${member.email}"><br>
					</div>
				</div>
				<div class="bottom">
				<div style="text-align: center; margin: 60px auto;">
					<input type="submit" value="주문완료">
				</div>
			</div>
			</div>
			
		</div>
	</form>
	</div>
</body>
</html>