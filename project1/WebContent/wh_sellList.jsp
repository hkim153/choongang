<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Dokdo&display=swap"
	rel="stylesheet">
<link href="test.css" rel="stylesheet" type="text/css">
<link href="test1.css" rel="stylesheet" type="text/css">
<style type="text/css">
#content {
	width: 1080px;
	position: relative;
	padding-bottom: 70px;
}
</style>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="js/main.js"></script>
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
			case 1: alert('배송 시작');
					location.replace('wh_SellList.do');
					break;
			case 2: alert('배송 완료');
					location.replace('wh_SellList.do');
					break;
			case 7: alert('환불처리 완료');
					location.replace('wh_SellList.do');
					break;
			case 8: alert('교환배송 시작');
					location.replace('wh_SellList.do');
					break;
			case 9: alert('교환배송 완료');
					location.replace('wh_SellList.do');
					break;
			default : alert('다시 시도해주세요.');
					location.replace('wh_SellList.do');
					break;
			}
		}
	});
}
</script>	

<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.result ne 1 }">
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "jw_loginForm.do";
		</script>
	</c:if>
	<div id="wrap">
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="container">
			<div id="content">
				<div class="_listRoot">
					<div class="list_title">
						<h1 style="margin: 20px 0px -20px 20px; font-family: 'Dokdo', cursive; font-size: 50px; font-weight: bold;">판매 내역</h1>
						<button value="메인으로" style="float: right; margin: 0 15px 15px 0;">
							<a href="main.do">메인으로</a>
						</button>
						<button value="마이페이지"
							style="float: right; margin: 0px 15px 15px 0;">
							<a href="javascript:history.back();">뒤로가기</a>
						</button>
						<hr style="width: 1080px;">
					</div>
					<div class="tab_content">
					<div class="tab">
						<div class="category1">
							<h3>
								<a href="#">주문 완료</a>
							</h3>
							<table class="description">
								<tr>
									<th></th>
									<th style="  width: 120px;">주문번호</th>
									
									<th style="  width: 90px;">구매자</th>
									<th style="  width: 130px;">연락처</th>
									
									<th  style="  width: 40px;">수량</th>
									<th style="  width: 90px;">금액</th>
									<th style="  width: 100px;">주문일자</th>
									<th style="  width: 100px;">상태</th>
									<th style="  width: 150px;">요청사항</th>
									<th></th>						
								</tr>
								<c:set var="stateNum1" value="0"/>
								<c:if test="${totCnt > 0 }">
								<c:forEach var="selllist" items="${selllist}">
									<c:if test="${selllist.state eq 0}">
									<c:set var="stateNum1" value="${stateNum1+1}"/>
									<tr>
										<td><input type="checkbox" value="${selllist.state}"></td>
										<td style="  width: 120px;"><fmt:formatDate pattern="yyyyMMdd" value="${selllist.reg_date}"/>${selllist.pro_num}${selllist.buy_num }</td>
										
										<td style="  width: 90px;">${selllist.name }</td>
										<td style="  width: 130px;">${selllist.tel }</td>
										
										<td  style="  width: 40px;">${selllist.quantity }개</td>
										<td style="  width: 90px;">${selllist.price }원</td>
										<td style="  width: 100px;">${selllist.reg_date }</td>
										<td style="  width: 100px;">주문 완료</td>
										<td style="  width: 150px;">${selllist.request_term }</td>
										<td><button onclick="change_state(1,${selllist.buy_num})">배송시작</button></td>
									</tr>
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${stateNum1 == 0 }">
									<tr>
										<td colspan=9>주문 내역이 없습니다. </td>
									</tr>
								</c:if>
							</table>
							
							<a class="more" href="#">more</a>
						</div>
						<div class="category2">
							<h3>
								<a href="#">배송/교환</a>
							</h3>
							<table class="description">
								<tr>
									<th></th>
									<th style="  width: 120px;">주문번호</th>
									
									<th style="  width: 90px;">구매자</th>
									<th style="  width: 130px;">연락처</th>
									
									<th  style="  width: 40px;">수량</th>
									<th style="  width: 90px;">금액</th>
									<th style="  width: 100px;">주문일자</th>
									<th style="  width: 100px;">상태</th>
									<th style="  width: 150px;">요청사항</th>		
									<th></th>				
								</tr>
								<c:set var="stateNum2" value="0"/>
								<c:if test="${totCnt > 0 }">
								<c:forEach var="selllist" items="${selllist}">
									<c:if test="${selllist.state eq 1 || selllist.state eq 2 || selllist.state eq 8 || selllist.state eq 9}">
									<c:set var="stateNum2" value="${stateNum2+1}"/>
									<tr>
										<td><input type="checkbox" value="${selllist.state}"></td>
										<td style="  width: 120px;"><fmt:formatDate pattern="yyyyMMdd" value="${selllist.reg_date}"/>${selllist.pro_num}${selllist.buy_num }</td>
										
										<td style="  width: 90px;">${selllist.name }</td>
										<td style="  width: 130px;">${selllist.tel }</td>
										
										<td  style="  width: 40px;">${selllist.quantity }개</td>
										<td style="  width: 90px;">${selllist.price }원</td>
										<td style="  width: 100px;">${selllist.reg_date }</td>
										<c:if test="${selllist.state eq 1 }">
										<td style="  width: 100px;" >배송 중</td>
										</c:if>
										<c:if test="${selllist.state eq 2 }">
										<td style="  width: 100px;">배송 완료</td>
										</c:if>
										<c:if test="${selllist.state eq 8 }">
										<td style="  width: 100px; ">교환배송 중</td>
										</c:if>
										<c:if test="${selllist.state eq 9 }">
										<td style="  width: 100px;">교환배송 완료</td>
										</c:if>
										<td style="  width: 150px;" colspan="2">${selllist.request_term }</td>
										<td>
											<c:if test="${selllist.state eq 1 }">
												<button onclick="change_state(2,${selllist.buy_num})">배송완료</button>
											</c:if>
											<c:if test="${selllist.state eq 8 }">
												<button onclick="change_state(9,${selllist.buy_num})">교환배송 완료</button>
											</c:if>
										</td>
									</tr>
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${stateNum2 == 0 }">
									<tr>
										<td colspan=9>배송/교환 내역이 없습니다. </td>
									</tr>
								</c:if>
							</table>
							
							<a class="more" href="#">more</a>
						</div>
						<div class="category3">
							<h3>
								<a href="#">취소/반품</a>
							</h3>
							<table class="description">
								<tr>
									<th></th>
									<th style="  width: 120px;">주문번호</th>
									
									<th style="  width: 90px;">구매자</th>
									<th style="  width: 130px;">연락처</th>
									
									<th  style="  width: 40px;">수량</th>
									<th style="  width: 90px;">금액</th>
									<th style="  width: 100px;">주문일자</th>
									<th style="  width: 100px;">상태</th>
									<th style="  width: 150px;">요청사항</th>		
									<th></th>						
								</tr>
								<c:set var="stateNum3" value="0"/>
								<c:if test="${totCnt > 0 }">
								<c:forEach var="selllist" items="${selllist}">
									<c:if test="${selllist.state eq 3 || selllist.state eq 4 || selllist.state eq 7}">
									<c:set var="stateNum3" value="${stateNum3+1}"/>
									<tr>
										<td><input type="checkbox" value="${selllist.state}"></td>
										<td style="  width: 120px;"><fmt:formatDate pattern="yyyyMMdd" value="${selllist.reg_date}"/>${selllist.pro_num}${selllist.buy_num }</td>
										
										<td style="  width: 90px;">${selllist.name }</td>
										<td style="  width: 130px;">${selllist.tel }</td>
										
										<td  style="  width: 40px;">${selllist.quantity }개</td>
										<td style="  width: 90px;">${selllist.price }원</td>
										<td style="  width: 100px;">${selllist.reg_date }</td>
										<c:if test="${selllist.state eq 3 }">
										<td style="  width: 100px;">취소 요청</td>
										</c:if>
										<c:if test="${selllist.state eq 4 }">
										<td style="  width: 100px;">반품 요청</td>
										</c:if>
										<c:if test="${selllist.state eq 7 }">
										<td style="  width: 100px;">환불처리 완료</td>
										</c:if>
										
										<td style="  width: 150px;">${selllist.request_term }</td>
										<td>
											<c:if test="${selllist.state eq 3 }">
												<button onclick="change_state(7,${selllist.buy_num})">환불처리</button>
											</c:if>
											<c:if test="${selllist.state eq 4 }">
												<button onclick="change_state(7,${selllist.buy_num})">환불처리</button>
											</c:if>
											</td>
									</tr>
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${stateNum3 == 0 }">
									<tr>
										<td colspan=9>배송/교환 내역이 없습니다. </td>
									</tr>
								</c:if>
							</table>
							
							<a class="more" href="#">more</a>
						</div>
						<div class="category4">
							<h3>
								<a href="#">구매 확정</a>
							</h3>
							<table class="description">
								<tr>
									<th></th>
									<th style="  width: 120px;">주문번호</th>
									
									<th style="  width: 90px;">구매자</th>
									<th style="  width: 130px;">연락처</th>
									
									<th  style="  width: 40px;">수량</th>
									<th style="  width: 90px;">금액</th>
									<th style="  width: 100px;">주문일자</th>
									<th style="  width: 100px;">상태</th>
									<th style="  width: 150px;">요청사항</th>
									<th></th>							
								</tr>
								<c:set var="stateNum4" value="0"/>
								<c:if test="${totCnt > 0 }">
								<c:forEach var="selllist" items="${selllist}">
									<c:if test="${selllist.state eq 6}">
									<c:set var="stateNum4" value="${stateNum4+1 }"/>
									<tr>
										<td><input type="checkbox" value="${selllist.state}"></td>
										<td style="  width: 120px;"><fmt:formatDate pattern="yyyyMMdd" value="${selllist.reg_date}"/>${selllist.pro_num}${selllist.buy_num }</td>
										
										<td style="  width: 90px;">${selllist.name }</td>
										<td style="  width: 130px;">${selllist.tel }</td>
										
										<td  style="  width: 40px;">${selllist.quantity }개</td>
										<td style="  width: 90px;">${selllist.price }원</td>
										<td style="  width: 100px;">${selllist.reg_date }</td>
										<c:if test="${selllist.state eq 6}">
										<td style="  width: 100px;">구매 확정</td>
										</c:if>
										<td style="  width: 150px;">${selllist.request_term }</td>
										
									</tr>
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${stateNum4 == 0 }">
									<tr>
										<td colspan=9>배송/교환 내역이 없습니다. </td>
									</tr>
								</c:if>
							</table>
							
							<a class="more" href="#">more</a>
						</div>
					</div>
					</div>
				</div>

			</div>
		</div>


		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>