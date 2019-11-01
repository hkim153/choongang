<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="./css/store.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
					<div class="pro_best">
						<div class="content">
							<div>
								<h3 class="best_tit">야낚자 추천 베스트 </h3>
								<div class="pro_list">
									<ul class="pro_wrap">
										<c:forEach var="poplist" items="${pop_list}">
											<li style="margin-right:opx;">
												<div>
													<div class="pro_img">
														 <img src="${pageContext.request.contextPath}/${poplist.img_folder}/${poplist.real_name}" alt="상품대표이미지"/>
													</div>
													<div class="pro_info">	
														<span class="pro_name"> ${poplist.pro_name} </span>
														<span class="price"> ${poplist.price } 원</span>
														<%-- <span class="sellcnt"> ${poplist.sellcnt }</span> --%>
														<span class="stock"> 
															<i>재고</i>
															<strong>${poplist.stock } 개</strong>
														</span>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					
					</div>
						<jsp:include page="footer.jsp"></jsp:include>
					</div>
</body>
</html>