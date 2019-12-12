<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Dokdo&display=swap" rel="stylesheet">
<style type="text/css">


#btnColor{
	border: 0;
	color: white;
	background-color: #3DB7CC;
	height: 29px;
	width: 90px;
	margin-right: 7px;
	font-size: 15px;
}

.menu-box-1 > ul ul{
	display: none;
	position: absolute;
	top:100%;
	left:0;
	z-index:200;
}

.menu-box-1 > ul ul ul{
 	left:100%;
 	top:0;

}

.menu-box-1  ul {
	background-color: #dfdfdf;
}

.menu-box-1 > ul {
	display: inline-block;
	border-radius: 10px;
	width:100%;
}

.menu-box-1  ul > li:hover > ul {
	display:block;
	background-color: #fffff;
}

.menu-box-1 {
	text-align: center;
}

.menu-box-1 > ul > li{
	display: inline-block;
	position: relative;
}

.menu-box-1  ul > li{
	position: relative;
}

.menu-box-1 ul > li > a {
	display: block;
	padding:10px;
	white-space: nowrap;
}

.menu-box-1  ul > li:hover > a {
	background-color: black;
	color:white;
}


.menu-box-1  ul > li:hover > ul{
	display: block;
}

body, ul, li{
	margin: 0;
	padding: 0;
	list-style: none;
}

a{
	color: inherit;
	text-decoration: none;
}


</style>

</head>
<body>
<div class="pro_menu">
				<div class="menu_title">
					<div>
						<span>상점(store)</span>
						<c:if test="${sessionScope.result eq 1 && adminResult eq 1}">
							<input type="button" value="판매리스트" onclick="sell_list()" style="float: right;" id="btnColor">
							<a href="wh_ProregistForm.do"><input type="button"	value="상품등록" style="float: right;" id="btnColor"> </a>
					</c:if>
					</div>
				</div>
				<hr>
				<div class="menu-box-1">
					<ul>
						<li><a href="wh_ProStorePart.do?b_code=1&m_code=00&s_code=00">낚시대</a>
							<ul>
								<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=00">민물낚시대</a>
									<ul>
										<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=01">붕어낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=02">잉어/향어낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=03">대물경질낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=04">은어낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=05">민물다용도 릴낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=06">장어릴낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=07">생활낚시대(피라미/견지/돌틈)</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=01&s_code=08">낚시대케이스</a></li>
									</ul>
								</li>
								<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=00">바다낚시대</a>
									<ul>
										<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=01">감성돔/벵에돔 릴낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=02">참돔낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=03">부시리낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=04">원투/홀치기 낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=05">갈치낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=06">선상 우럭 낚시대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=07">바다민장대</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=1&m_code=02&s_code=08">낚시대거치대</a></li>
							    	</ul>
								</li>
							</ul>
						</li>
						<li><a href="wh_ProStorePart.do?b_code=2&m_code=00&s_code=00">릴</a>
							<ul>
								<li><a href="wh_ProStorePart.do?b_code=2&m_code=01&s_code=00">전동릴</a>
									<ul>
										<li><a href="wh_ProStorePart.do?b_code=2&m_code=01&s_code=01">시마노</a></li>
							    	</ul>
								</li>
								<li><a href="wh_ProStorePart.do?b_code=2&m_code=02&s_code=00">베이트릴(배스,가물치,바다용)</a>
									<ul>
										<li><a href="wh_ProStorePart.do?b_code=2&m_code=02&s_code=01">배스용 베이트릴</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=2&m_code=02&s_code=02">가물치용 장구통릴</a></li>
							    		<li><a href="wh_ProStorePart.do?b_code=2&m_code=02&s_code=03">바다용 베이트릴</a></li>
							    	</ul>
								</li>
							</ul>
						</li>
						 <li><a href="wh_ProStorePart.do?b_code=3&m_code=00&s_code=00">줄</a>
							<ul>
								<li><a href="#">2차 메뉴 아이템 1</a></li>
								<li><a href="#">2차 메뉴 아이템 2</a></li>
								<li><a href="#">2차 메뉴 아이템 3</a></li>
								<li><a href="#">2차 메뉴 아이템 4</a></li>
							</ul>
						</li>
						<li><a href="wh_ProStorePart.do?b_code=4&m_code=00&s_code=00">찌</a></li>
							<ul>
								<li><a href="#">2차 메뉴 아이템 1</a></li>
								<li><a href="#">2차 메뉴 아이템 2</a></li>
								<li><a href="#">2차 메뉴 아이템 3</a></li>
								<li><a href="#">2차 메뉴 아이템 4</a></li>
							</ul>
						</li>
						<li><a href="wh_ProStorePart.do?b_code=5&m_code=00&s_code=00">루어</a></li>
						<li><a href="wh_ProStorePart.do?b_code=6&m_code=00&s_code=00">뜰채</a></li>
						<li><a href="wh_ProStorePart.do?b_code=7&m_code=00&s_code=00">가방</a></li>
					</ul>
				</div>
				<hr>
			</div>
</body>
</html>