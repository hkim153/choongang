<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/product.css" rel="stylesheet" type="text/css">
<style type="text/css">
 #footer .mid-f{
 	display: block;
 	height:120px;
 	background: #2e2e2e;
 	padding: 25px 0;
 }
#footer .mid-f .content{
 	width:1020px;
 	padding:0 15px;
 	margin: 0 auto;
 	position : relative;
 }
 #footer .mid-f>.content>div.f-notice{
 	border-right:1px solid #434343;
 }
 .notice_box{
 	text-align: left;
 	max-width: 440px;
 }
 h4{
 	display: block;
 	margin-block-start: 1.33em;
 	margin-block-end: 1.33em;
 	margin-inline-start:0px;
 	margin-inline-end:0px;
 }
  .notice_box h4{
  	font-size: 13px;
  	font-weight: bold;
  	color:#dcdcdc;
  	margin-bottom:20px;
  	margin:0;
  	padding:0;
  }
 
 .notice_box ul{
 	margin:0;
 	padding:0;
 	list-style:none;
 }
 li{
 	display: list-item;
 	text-align:  -webkit-match-parent;
 }
 
 .notice_box dl{
 	margin:0;
 	padding:0;
 }
  dl{
 	display: block;
 	margin-block-start: 1em;
 	margin-block-end: 1em;
 	margin-inline-start:0px;
 	margin-inline-end:0px;
 }
 
 .notice_box dt{
 	float:left;
 	width:360px;
 	overflow:hidden;
 	text-overflow: ellipsis;
 	white-space: nowrap;
 	margin:0;
 	padding:0;
 	display: block;
 	font-size: 15px;
 }
 
 .notice_box dd{
 	margin:0;
 	float:right;
 	padding-left:10px;
 	font-size: 12px;
 	color:#666;
 	font-family: Arial;
 	display: block;
 }
 
  .notice_box a{
  	padding-bottom: 5px;
  	display: block;
  	text-decoration: none;
  	color:#969696;
  	font-size:12px;
  }
  
  #footer .mid-f>.content>div.f-cs{
  	border-left:1px solid #000;
  }
 
  #footer .mid-f>.content>div.f-cs>div{
  	padding:0 0 0 30px;
  	text-align: right;
  	font-size:0;
  }
  #footer .mid-f>.content>div.f-cs>div>span{
  	margin-right:26px;
  }
  #footer .mid-f>.content>div.f-cs>div>a{
  	margin-left:5px;
  }
 #footer .mid-f>.content>div{
 	width:50%;
 	max-width: 469px;
 	float:left;
 }
</style>
</head>
<body>
	<div id="footer">
		<div class="mid-f">
			<div class="content">
				<div class="f-notice">
					<div class="notice_box">
						
						<h2>찾아오시는길</h2>
						<ul>
							<li><a><dl><dt>(우)06134 | 서울 강남구 테헤란로7길 7, 7층</dt></dl></a></li>
							<li><a><dl><dt>(지번)역삼동 649-5</dt></dl></a></li>							
						</ul>
					</div>
				</div>
				<div class="f-cs">
					<div>
						<span>
							<img src="./images/cs.png" style="vertical-align:middle;border:0;">
						</span>
						<a href='wh_OrderList.do'>
							<img src="./images/order_s.png" style="vertical-align:middle;border:0;">
						</a>
						<a>
							<img src="./images/board_button.png" style="vertical-align:middle;border:0;">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>