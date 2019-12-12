<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
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
<script type="text/javascript">
function  change_state(state,buy_num){

	var buy_num = buy_num;
	var order_state = state;
	$.ajax({
		url:"ajaxChangeState.jsp",
		data:{state : order_state , buy_num : buy_num},
		dataType:'text',
		success:function(data){
			var state =  parseInt(data);
			switch(state){
			case 3: alert('취소요청 완료');
					location.replace('wh_OrderContent.do?buy_num='+buy_num);
					break;
			case 4: alert('반품요청 완료');
					location.replace('wh_OrderContent.do?buy_num='+buy_num);
					break;
			case 5: alert('교환요청 완료');
					location.replace('wh_OrderContent.do?buy_num='+buy_num);
					break;
			case 6: alert('구매 확정');
					location.replace('wh_OrderContent.do?buy_num='+buy_num);
					break;
			default : alert('다시 시도해주세요.');
					location.replace('wh_OrderContent.do?buy_num='+buy_num);
					break;
			}
		}
	});
}
</script>

<title>Insert title here</title>
</head>
<body>
	<c:if test = "${sessionScope.result ne 1 }">
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href="jw_loginForm.do";
		</script>
	</c:if>
	<div id="wrap">
		<div>
		
			<jsp:include page="header.jsp"></jsp:include>
		</div>
	
		<div class="container">
			<div>
				<div style="width:100%; padding: 20px 0;">
					<h2 style="float:left;">주문/결제 상세내역</h2>
					<h5 style="float:right;"> 주문완료 </h5>
				</div>
				<hr style="width:1080px;">
				<table border="1" style="width:1080px; text-align: center;">
					<tr style="height:60px;">
						<th colspan="2">상품정보</th><th>판매자</th><th>배송비</th><th>수량</th><th>할인</th><th>주문금액</th>
					</tr>
					<tr >
						<td colspan="7" style="background-color: #D4F4FA;" ><strong>이글 찾은 사람 츄파츕스 하나 ! 띱 ! 저에게 오세요.(칭찬)</strong></td>
					</tr> 
					<tr>
						<td>
							<img src="${pageContext.request.contextPath}/${first_img}" style="width: 100px;">
						</td>
						<td  style="text-align: left; padding-left: 25px; font-weight: bold;">주문번호 : ${ordernum} <p>
							${ordercontent.pro_name}
						</td>
						<td>
							${ordercontent.sell_name }
						</td>
						<td>
							무료
						</td>
						<td>
							${ordercontent.quantity}개
						</td>
						<td>
						 -
						</td>
						<td>
							<strong>${ordercontent.price}원</strong>
						</td>
					</tr>
				</table>
			</div>
			<hr style="width: 1080px; ">
			<div>
				<div class="left">
					<div style="margin-left: 45px; ">
						<div>
							<h3>판매자 정보</h3>
							<div>
								${ordercontent.sell_name}<p>
								${ordercontent.tel2}<p>
								${ordercontent.sell_address}<p>
							</div>
							
						</div>
					</div>
					<br>
					<br>
					<div style="margin-left: 45px; ">
						<div>
							<h3>배송지 정보</h3>
							<div>
								${ordercontent.name}<p>
								${ordercontent.tel}<p>
								${ordercontent.address}<p>
							</div>
							<div>
								<span style="font-size: 10px; font-weight: bold; color:gray;">요청 사항</span><br> 
								${ordercontent.request_term}
							</div>
						</div>
					</div>
				</div>
				<div class="right">
					<div style="margin-left: 45px;">
						<h5>주문자 정보</h5>
						${ordercontent.name}<p>
						${ordercontent.tel}<p>
						${ordercontent.email}<br>
					</div>
				</div>
				<div class="bottom">
					<div class="change_btn" style="text-align: center; margin: 30px auto;">
						<c:if test="${ordercontent.state eq 0}">
							<button onclick="change_state(3,${ordercontent.buy_num})">취소요청</button>
						</c:if>
						<c:if test="${ordercontent.state eq 1}">
							해당 상품이 배송 중 입니다.
						</c:if>
						<c:if test="${ordercontent.state eq 3}">
							취소요청 되었습니다. 확인 후 처리 도와드리겠습니다.
						</c:if>
						<c:if test="${ordercontent.state eq 2  || ordercontent.state eq 8}">
							<button onclick="change_state(4,${ordercontent.buy_num})">반품요청</button>&nbsp; &nbsp; &nbsp;
							<button onclick="change_state(5,${ordercontent.buy_num})">교환요청</button>&nbsp; &nbsp; &nbsp;
							<button onclick="change_state(6,${ordercontent.buy_num})">구매확정</button>
						</c:if>
						<c:if test="${ordercontent.state eq 4}">
							반품요청 되었습니다. 확인 후 처리 도와드리겠습니다.
						</c:if>
						<c:if test="${ordercontent.state eq 7}">
							환불 처리 되었습니다. 불편을드려 죄송합니다.
						</c:if>
					</div>
					<div class="back_btn" style="text-align: center; margin: 30px auto;">
						<input type="button" value="뒤로" onclick="history.back(-1);">
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>