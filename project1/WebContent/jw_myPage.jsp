<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="test1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:if test = "${sessionScope.result ne 1 }">
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href="jw_loginForm.do";
		</script>
	</c:if>
	<div id="wrap1">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		
		<div id="container" style="height: 968px;">
			<div id="content" class="section_home">
			
				<!-- 왼쪽칼럼시작  -->
				
				<div class="column">
					<div class="sh_group">
						<div class="sh_header">
							<h2>여기는 프로필</h2>
						</div>
						<div class="sh_content">
							<dl class="sh_list">							
							
								<dt class="nin_tit">이름</dt>
								<dd class="nic_desc">${name}</dd>																
								<br>
								
								<dt class="nic_tit">E-Mail</dt>
								<dd class="nic_desc">${email }</dd>								
								<br>								
								
								<dt class="nic_tit">주소</dt>
								<dd class="nic_desc">${address }</dd>								
								<br>
								
								<dt class="nic_tit">전화번호</dt>
								<dd class="nic_desc">+82 ${tel }</dd>
												
							</dl>
						</div>
						<p class="btn_area_btm">
							<input type="button" onclick="location.href='ws_myPageModifyForm.do'" value="수정하기" class="btnColor">
								<input type="button" value="탈퇴하기" onclick="location.href='jw_outForm.do'" class="btnColor">
						</p>
					</div>
										
					<div class="sh_group">
						<div class="sh_header">
							<h2>작성한 게시글</h2>
						</div>
						<div class="sh_content">
						<c:choose>
						<c:when test="${empty myList }">
						<tr>
						<td style="text-align: center" colspan="5">작성한글이 없습니땅!</td>
						<p>
						<td><input type="button" value="글 작성하기" onclick="location.href='sh_board.do'" class="btnColor1"></td>						
						</tr>						
						</c:when>
						
						<c:when test="${not empty myList }">
							<table>							 
							<tr>
							<th>말머리</th>
							<th >제목</th>
							<th>작성일</th>
							</tr>
							
							<c:set var = "startNum" value="1"/>
							<c:forEach var="board" items="${myList }">
							<tr>							
							<td><c:if test="${board.b_head ==2}">[자유]</c:if>
							<c:if test="${board.b_head == 3 }">[팁]</c:if></td>
							<td class="left" width="200" >
							<a href="sh_content.do?b_num=${board.b_num}&pageNum=1&status=0">${board.b_title}</a></td>
							<td>${board.b_date }</td>
							</tr>							
							<c:set var="startNum" value="${startNum +1 }"/>
							</c:forEach>
													
							</table>							
							</c:when>
							</c:choose>
						</div>		
						<h6 style="text-align: center">최근 작성한 5개의 게시글입니다.</h6>				
					</div>					
				</div>
				
				<!-- 여기서부터 오른쪽 칼럼 -->
				
				<div class="column">
					<div class="wh_group4">
						<div class="wh_header">
							<h2>여기는 인원모집기록</h2>
						</div>
						<div class="wh_content">
						<c:choose>
						<c:when test="${empty myRecruit }">
						<tr>
						<td style="text-align: center" colspan="5">현재 참여중인 모임이 없습니다 !</td>
						<p>
						<td>
						<input type="button" value="참여하기" onclick="location.href='dh_recruitList.do'" class="btnColor">
						</td>
						</c:when>
						
						<c:when test="${not empty myRecruit }">
							<table>
							<tr>
							<th>방제목</th>
							<th>작성일</th>
							</tr>
							
							<c:set var = "startNum" value="1"/>
							<c:forEach var="Recruit" items="${myRecruit }">
							<tr>
							<td>
							<c:if test="${Recruit.recruit_title}">${Recruit.recruit_title}</c:if>
							<td class="left" width="200" >
							<a href="dh_recruit_content.do?recruit_num=${Recruit.recruit_num}">${Recruit.recruit_title}</a></td>
							<td>${Recruit.reg_date }</td>
							</tr>
							<c:set var="startNum" value="${startNum +1 }"/>
							</c:forEach>
													
							</table>							
							</c:when>
							</c:choose>
							</div>
							<h6 style="text-align: center">최근 참여한 5개의 모임정보 입니다.</h6>
		
						</div>
						
					
					<div class="wh_group4">						
							<div class="wh_header">
								<h2 style="margin-block-start:0;">구매현황	</h2>
							</div>
							<div class="wh_content" style="background-color: #EAEAEA;">
								<ul>
										<li>
											<div class="inner">
												<span><img src="images/delivery.png" alt="배송중"/></span>
												<dl>
													<dt>배송중</dt>
													<dd class="com_num">
														<c:forEach var="orderstate" items="${orderstate }">
															<c:if test="${orderstate.state == 1 && orderstate.state_count != 0}">
																<em class="num0">${orderstate.state}</em>
															</c:if>
															 <c:if test="${orderstate.state == 1 && orderstate.state_count == 0}">
																<em class="num0">${orderstate.state_count}</em>
															</c:if> 
														</c:forEach>
													</dd>
												</dl>
											</div>
										</li>
										<li>
											<div class="inner">
												<span><img src="images/arrive.png" alt="배송완료"/></span>
												<dl>
													<dt>배송완료</dt>
													<dd class="com_num">
														<c:forEach var="orderstate" items="${orderstate }">
															<c:if test="${orderstate.state == 2 && orderstate.state_count != 0}">
																<em class="num0">${orderstate.state_count}</em>
															</c:if>
															<c:if test="${orderstate.state == 2 && orderstate.state_count == 0}">
																<em class="num0">${orderstate.state_count}</em>
															</c:if>
														</c:forEach>
													</dd>
												</dl>
											</div>
										</li>
										<li>
											<div class="inner">
												<span><img src="images/return.png" alt="취소/반품/교환"/></span>
												<dl>
													<dt>취소/반품/교환</dt>
													<dd class="com_num">
																<c:if test="${total > 0}">
																	<em class="num0">${total}</em>
																</c:if>
																<c:if  test="${total == 0}">
																	<em class="num0">0</em> 
																</c:if>
													</dd>
												</dl>
											</div>
										</li>
									
								</ul>
							</div>
							<p class="btn_area_btm" style="text-align: right; margin: 20px 40px 0;">
								<input type="button" onclick="location.href='wh_OrderList.do'"
									value="구매내역" class="btnColor">
							</p>		 				
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