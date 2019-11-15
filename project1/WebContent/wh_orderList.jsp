<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="test.css" rel="stylesheet" type="text/css">
<link href="test1.css" rel="stylesheet" type="text/css">
<style type="text/css">
#content {
	width: 1080px;
	position:relative;
	padding-bottom:70px;
}

.sub_sc{
	overflow: hidden;
    position: relative;
    z-index: 10;
    padding: 0;
    background-color: #fff;
}
ul, ol{
	list-style:none;
}
ul{
	margin:0;
	padding:0;
	display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

ul ul{
	list-style-type: circle;
    margin-block-start: 0px;
    margin-block-end: 0px;
}

li{
	text-align: -webkit-match-parent;
}

a{
	text-decoration: none;
}

a:-webkit-any-link {
	color: -webkit-link;
    cursor: pointer;
}

p{
	display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    margin:0;
    padding:0;
}

strong {
    font-weight: bold;
}
.goods_pay_item{
	display: table;
    width: 1075px;
    min-height: 161px;
    padding: 23px 0 24px;
    table-layout: fixed;
    text-align: -webkit-match-parent;
    border: 2px inset #6A84B7
}

.goods_pay_item .goods_item{
	position: relative;
    padding-left: 129px;
    width: 500px;
}

.goods_pay_item > div{
	display: table-cell;
    vertical-align: middle;
}

.goods_pay_item .goods_item .goods_thumb{
	overflow: hidden;
    position: absolute;
    left: 9px;
    top: 50%;
    width: 90px;
    height: 90px;
    margin-top: -45px;
    text-align: center;
}

.goods_pay_item .goods_item .goods_thumb img{
	vertical-align: top;
	border:0;
	width:90px;
	height:90px;
}

.goods_pay_item .goods_item .goods_info{
	font-size: 13px;
}

.goods_pay_item .goods_item .goods_info .goods{
	display: block;
    text-decoration: none;
}

.goods_pay_item .goods_item .goods_info .goods .name{
	max-width: 100%;
    overflow: hidden;
    color: #000;
    font-size: 16px;
    white-space: nowrap;
    -ms-text-overflow: ellipsis;
    text-overflow: ellipsis;
    text-decoration: none;
}

.goods_pay_item .goods_item .goods_info .goods .info{
	margin: 8px 0px 12px;
}

.goods_pay_item .goods_item .goods_info .goods .info li {
	display: inline-block;
    color: #000;
    font-size: 14px;
    line-height: 18px;
    list-style: none;
}

.blind{
	visibility: hidden;
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
}

#content .date{
	position: relative;
    margin: 0 10px;
    color: #808080;
}

.goods_pay_item .goods_item .goods_info .goods .info li.date{
	color: #a5a5a5 !important;
    font-family: Helvetica, '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum, sans-serif;
}

.goods_pay_item .goods_item .goods_info .goods .info li + li{
	margin: 0 0 0 8px !important;
    padding-left: 11px;
}

.info li{
	color:black;
	list-style:none;
}

.goods_pay_item .goods_item .goods_info .state{
	   color: #a5a5a5;
}

.goods_pay_item .goods_item .goods_info{
	margin-top: 10px;
    padding-top: 10px;
    color: #646465;
    line-height: 18px;
    border-top: 1px solid #f4f6f7;
}

.goods_pay_item .seller_item{
	width: 150px;
}

.goods_pay_item .seller_item .inner{
	padding: 0 25px;
    color: #000;
    text-align: center;
}
.goods_pay_item .seller_item .inner > * {
	display: block;
}

.goods_pay_item .seller_item .inner .seller{
	overflow: hidden;
    max-width: 100%;
    white-space: nowrap;
    -ms-text-overflow: ellipsis;
    text-overflow: ellipsis;
    margin-bottom: 5px;
}

.goods_pay_item .seller_item .inner .tel{
	margin-bottom: 5px;
    color: #a5a5a5;
    font-size: 11px;
    font-family: Helvetica, '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum, sans-serif;
}

.button_item .inner{
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="container">
			<div id="content">
				<div class="_listRoot">
				<div class="list_title">
					<h1 style="margin: 20px 0px -20px 20px;"> 구매 내역 </h1>
					<button value="메인으로" style="float:right; margin: 0 15px 15px 0;"><a href="main.do">메인으로</a></button>
					<button value="마이페이지" style="float:right; margin: 0px 15px 15px 0;"><a href="javascript:history.back();">마이페이지</a></button>
					<hr style="width:1080px;">
				</div>
				<div class="sub_sc" style="min-height:850px;">
				<div id="_listContentArea">
				<div class="goods_pay_section">
				<c:forEach var="orderlist" items="${orderlist }">
					<div>
						<ul>
							<li class="goods_pay_item">
								<div class="goods_item">
										<a href="wh_ProContent.do?pro_num=${orderlist.pro_num }&pro_code=${orderlist.pro_code}" class="goods_thumb">
											<img src="${pageContext.request.contextPath}/${orderlist.img_folder}/${orderlist.real_name }" >
										</a>
									
									<div class="goods_info">
										<a href="wh_ProContent.do?pro_num=${orderlist.pro_num }&pro_code=${orderlist.pro_code}" class="goods">
											<p class="name">${orderlist.pro_name}</p>
											<ul class="info">
												<li>
													<span class="blind">상품금액</span>${orderlist.price }원
												</li>
												<li>
													<span class="blind">상품구매날짜
													</span>${orderlist.reg_date}
												</li>
											</ul>
										</a>
										<c:choose>
											<c:when test="${orderlist.state eq 0}">
												<span class="state">
													주문완료										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 1}">
												<span class="state">
													배송중										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 2}">
												<span class="state">
													배송완료										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 3}">
												<span class="state">
													구매취소										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 4}">
												<span class="state">
													반품										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 5}">
												<span class="state">
													교환										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 6}">
												<span class="state">
													구매확정										
												</span>
											</c:when>
										</c:choose>
										<p class="guide">구매가 완료되었습니다. 이용해주셔서 감사합니다. <br>
										<c:if test="${orderlist.state eq 6}">
											구매확정 이후 <strong> 상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</strong>
										</c:if>
										</p>
									</div>
								</div>
								<div class="seller_item">
									<div class="inner">
										<span class="seller">${orderlist.seller }</span>
										<span class="tel">${orderlist.tel }</span>
										<a href="#"><img src="./images/ask.png"></a>
									</div>
								</div>
								<div class="button_item">
									<div class="inner">
										<c:if test="${orderlist.state eq 0}">
											<button value="취소요청">취소요청</button>
										</c:if>
										<c:if test="${orderlist.state eq 2}">
											<button value="반품요청">반품요청</button><br><br>
											<button value="교환요청">교환요청</button><br><br>
											<button value="구매확정">구매확정</button><br><br>
										</c:if>
									</div>
								</div>	
							</li>
						</ul>
					</div>
				</c:forEach>
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