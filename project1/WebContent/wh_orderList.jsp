<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Dokdo&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
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
.lists__item{
	margin: 5px auto;
    width: 1075px;
    min-height: 161px;
    padding: 23px 0 24px;
    table-layout: fixed;
    text-align: -webkit-match-parent;
    border: 2px inset #6A84B7
}

.lists__item .goods_item{
	position: relative;
    padding-left: 129px;
    width: 500px;
}

.lists__item > div{
	display: table-cell;
    vertical-align: middle;
}

.lists__item .goods_item .goods_thumb{
	overflow: hidden;
    position: absolute;
    left: 9px;
    top: 50%;
    width: 90px;
    height: 90px;
    margin-top: -45px;
    text-align: center;
}

.lists__item .goods_item .goods_thumb img{
	vertical-align: top;
	border:0;
	width:90px;
	height:90px;
}

.lists__item .goods_item .goods_info{
	font-size: 13px;
}

.lists__item .goods_item .goods_info .goods{
	display: block;
    text-decoration: none;
}

.lists__item .goods_item .goods_info .goods .name{
	max-width: 100%;
    overflow: hidden;
    color: #000;
    font-size: 16px;
    white-space: nowrap;
    -ms-text-overflow: ellipsis;
    text-overflow: ellipsis;
    text-decoration: none;
}

.lists__item .goods_item .goods_info .goods .info{
	margin: 8px 0px 12px;
}

.lists__item .goods_item .goods_info .goods .info li {
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

.lists__item .goods_item .goods_info .goods .info li.date{
	color: #a5a5a5 !important;
    font-family: Helvetica, '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum, sans-serif;
}

.lists__item .goods_item .goods_info .goods .info li + li{
	margin: 0 0 0 8px !important;
    padding-left: 11px;
}

.info li{
	color:black;
	list-style:none;
}

.lists__item .goods_item .goods_info .state{
	   color: #a5a5a5;
}

.lists__item .goods_item .goods_info{
	margin-top: 10px;
    padding-top: 10px;
    color: #646465;
    line-height: 18px;
}

.lists__item .seller_item{
	width: 150px;
}

.lists__item .seller_item .inner{
	padding: 0 25px;
    color: #000;
    text-align: center;
}
.lists__item .seller_item .inner > * {
	display: block;
}

.lists__item .seller_item .inner .seller{
	overflow: hidden;
    max-width: 100%;
    white-space: nowrap;
    -ms-text-overflow: ellipsis;
    text-overflow: ellipsis;
    margin-bottom: 17px;
    margin-top:22px;
}

.lists__item .seller_item .inner .tel{
	margin-bottom: 5px;
    color: #a5a5a5;
    font-size: 11px;
    font-family: Helvetica, '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum, sans-serif;
}

.lists__item .seller_item .inner a img{
	width: 160px;
}

.button_item{
	width:236px;
}

.button_item .inner{
	text-align: center;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
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
		<div id="container">
			<div id="content">
				<div class="_listRoot">
				<div class="list_title">
					<h1 style="margin: 20px 0px -20px 20px;"> 구매 내역 </h1>
					<button value="메인으로" style="float:right; margin: 0 15px 15px 0;"><a href="main.do">메인으로</a></button>
					<button value="마이페이지" style="float:right; margin: 0px 15px 15px 0;"><a href="javascript:history.back();">마이페이지</a></button>
					<hr style="width:1080px;">
				</div>
				<div class="sub_sc">
				<div id="_listContentArea">
				<div class="goods_pay_section">
					<div id="js-load" class="main">
						<ul class="lists">
							<c:forEach var="orderlist" items="${orderlist }">
							<li class="lists__item js-load">
								<div class="goods_item">
										<a href="wh_OrderContent.do?buy_num=${orderlist.buy_num }" class="goods_thumb">
											<img src="${pageContext.request.contextPath}/${orderlist.img_folder}/${orderlist.real_name }" >
										</a>
									
									<div class="goods_info">
										<a href="wh_OrderContent.do?buy_num=${orderlist.buy_num }" class="goods">
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
													구매취소 요청(환불)										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 4}">
												<span class="state">
													반품 요청(환불)								
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
											<c:when test="${orderlist.state eq 7}">
												<span class="state">
													환불처리 완료										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 8}">
												<span class="state">
													교환배송중										
												</span>
											</c:when>
											<c:when test="${orderlist.state eq 9}">
												<span class="state">
													교환배송 완료										
												</span>
											</c:when>
										</c:choose>
										<p class="guide">
										<c:if test="${orderlist.state eq 0 ||orderlist.state eq 1||orderlist.state eq 2 || orderlist.state eq 6}">
										구매가 완료되었습니다. 이용해주셔서 감사합니다. <br>
										</c:if>
										<c:if test="${orderlist.state eq 3}">
										취소요청 되었습니다. 더 좋은 상품으로 준비하겠습니다. <br>
										</c:if>
										<c:if test="${orderlist.state eq 4}">
										반품요청 되었습니다. 더 좋은 상품으로 준비하겠습니다. <br>
										</c:if>
										<c:if test="${orderlist.state eq 5}">
										교환요청 되었습니다. 이용해주셔서 감사합니다. <br>
										</c:if>
										<c:if test="${orderlist.state eq 6}">
											구매확정 이후 <strong> 상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</strong>
										</c:if>
										</p>
										
										<c:if test="${orderlist.state eq 4}">
										<p class="guide">구매가 완료되었습니다. 이용해주셔서 감사합니다. <br>
										<c:if test="${orderlist.state eq 6}">
											구매확정 이후 <strong> 상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</strong>
										</c:if>
										</p>
										</c:if>
									</div>
								</div>
								<div class="seller_item">
									<div class="inner">
										<span class="seller">${orderlist.sell_name }</span>
										<span class="tel">${orderlist.tel }</span>
										
										<a href="javascript:alert('죄송합니다. 해당 기능은 준비중 입니다.')"><img src="./images/ask.png">
										</a>
									</div>
								</div>
								<div class="button_item">
									<div class="inner">
										<button type="button" onclick="location.href = 'wh_OrderContent.do?buy_num=${orderlist.buy_num }'">주문내역 상세보기</button>
									</div>
								</div>	
							</li>
						</c:forEach>
						</ul>
						<div id="js-btn-wrap" class="btn-wrap">
							 <a href="javascript:;" class="button">
							 	<span style="color:#3db7cc; font-size:30px;">+ 더보기</span>
							 </a> 
						</div>
					</div>
				
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