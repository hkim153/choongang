<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<form action="" method="post" name="frm">
		<input type="hidden" name="totalPrice" value="${totalPrice}">	
		<input type="hidden" name="quantity" value="${quantity}">
		<input type="hidden" name="quantity" value="${proContent.pro_num}">
		<div>
			<table border="1">
				<tr>
					<th colspan="2">상품정보</th><th>판매자</th><th>배송비</th><th>수량</th><th>할인</th><th>주문금액</th>
				</tr>
				<tr>
					<td colspan="7" style="text-align: center;" >많이 많이 구매해주세요.</td>
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
						<strong>${quantity}원</strong>
					</td>
				</tr>
			</table>

<input type="text" name="name" value="${member.name}">
<input type="email" name="email" value="${member.email}">
<input type="text" name="address" value="${member.address}">
<input type="text" name="tel" value="${member.tel}">
		</div>
	</form>
	</div>
</body>
</html>