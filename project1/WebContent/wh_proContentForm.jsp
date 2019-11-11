<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/image-slideshow.js"></script>

<link href="test.css" rel="stylesheet" type="text/css">
<link href="./css/store.css" rel="stylesheet" type="text/css">
<link href="./css/image-slideshow.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function sum_price(){
		var price = ${proContent.price}
		var quantity = document.getElementById('quantity').value;
		var totalPrice = price * quantity;
		
		/* $("#totalPrice").html(totalPrice); 
		$('#totalPrice').text(totalPrice); */
		$(function(){
			
			document.frm.totalPrice.value=totalPrice;
			$('#totalPrice').html("<strong>"+totalPrice+"<strong>");
		});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<div id="wrap">
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<form action="wh_proOrderForm.do" onsubmit="return chk()" name="frm">
		<input type="hidden" name="pro_num" value="${proContent.pro_num}">
		<input type="hidden" name="pro_code" value="${proContent.pro_code}">
		<input type="hidden" name="totalPrice" value="${proContent.price}">
		
		<div id="dhtmlgoodies_slideshow">
			<div id="previewPane">
				<img src="${pageContext.request.contextPath}/${first_img}"> <span id="waitMessage"></span>
				<div id="largeImageCaption"></div>
			</div>
			<div id="galleryContainer">
				<div id="arrow_left">
					<img src="images/arrow_left.gif">
				</div>
				<div id="arrow_right">
					<img src="images/arrow_right.gif">
				</div>
				<div id="theImages">
					<!-- Thumbnails -->
					<c:forEach var="content_img" items="${proContent_img}">
						<a href="#" onclick="showPreview('${pageContext.request.contextPath}/${content_img.img_folder}/${content_img.real_name }','1');return false">
							<img src="${pageContext.request.contextPath}/${content_img.img_folder}/${content_img.real_name }">
						</a> 
					</c:forEach>
					<!-- End thumbnails -->
					<div class="imageCaption"></div>

					<div id="slideEnd"></div>
				</div>
			</div>
		</div>
		<div>
			<div>
				<div>
					${proContent.pro_name}
				</div>
				<div>
					판매가 : ${proContent.price}
				</div>
				<div>
					제조사 : ${proContent.pro_made}
				</div>
				<div>
					원산지 : ${proContent.origin}
				</div>
				<div>
					상품번호 : ${proContent.pro_num }
				</div>
				<div>
					구매수량 : <select id ="quantity" name="quantity" onchange="sum_price()">
								<option value="0">수량선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
				</div>
				<div id="totalPrice">
						<strong>${proContent.price}</strong>
				</div>
				<div>
					<input type="submit" value="구매하기">
				</div>
			</div>
		</div>
		<div>
			<div>
				상세정보 :  <img src="${pageContext.request.contextPath}/${proContent.img_folder}/${proContent.real_name }">
			</div>
		</div>
		</form>
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>