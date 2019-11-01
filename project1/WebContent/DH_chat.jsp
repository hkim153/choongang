<!-- https://www.youtube.com/watch?v=8s98IhtgwZ0&list=PLRx0vPvlEmdAlUbX_TGDxaSxKCvfl2isa&index=6 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
		String CHAT_ID = null;
		if (session.getAttribute("CHAT_ID") != null) {
			CHAT_ID = (String) session.getAttribute("CHAT_ID");
		}
		String CHAT_TO_ID = null;
		if(request.getParameter("CHAT_TO_ID") != null) {
			CHAT_TO_ID = (String) request.getParameter(CHAT_TO_ID);
		}
	%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<!-- CSS here -->
<link rel="stylesheet" href="DH_custom.css">

<title>JSP ajax real time chat</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">

// Sending message to someone with ajax, 비동기적 통신으로 구현
	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() { alert.hide() }, delay);
	}
	function submitFunction() {
		var CHAT_FROM_ID = '<%= CHAT_ID %>';
		var CHAT_TO_ID = '<%= CHAT_TO_ID %>';
		var CHAT_CHATCONTENT = $('#CHAT_CHATCONTENT').val();
		$.ajax({
				type: "POST",
				url: "./chatSubmitServlet",
				date: {
					CHAT_FROM_ID: encodeURIComponent(CHAT_FROM_ID),
					CHAT_TO_ID: encodeURIComponent(CHAT_TO_ID),
					CHAT_CHATCONTENT: encodeURIComponent(CHAT_CHATCONTENT),
				},
				success: function(result) {
					if(result == 1) {
						autoClosingAlert('#successMessage', 2000);
					} else if (result == 0) {
						autoClosingAlert('#dangerMessage', 2000);
					} else {
						autoClosingAlert('#warningMessage', 2000);
					}
				} 
		});
		$('#CHAT_CHATCONTENT').val('');  	// ajax function visualised
											// Whether successfully sent data or not, this statement executes every time.									
	}
	var lastID = 0;		// lastCHAT_ID = 0;
	function chatListFunction(type) {
		var CHAT_FROM_ID = '<%= CHAT_ID %>';		/* userID */
		var CHAT_TO_ID = '<%= CHAT_TO_ID %>';
		$.ajax({
			type "POST", //다른 사람이 쉽게 볼 수 없는 형태로 만듬
			url: "./chatListServlet", 
			data: {
				CHAT_FROM_ID: encodeURIComponent(CHAT_FROM_ID),
				CHAT_TO_ID: encodeURIComponent(CHAT_TO_ID),
				listType: type
			},
			success: function {
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i = 0; i < result.length; i++) {
					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
				}
				lastID = Number(parsed.last); // ChatListServlet에 해당하는 가장 마지막 즉 \"last\":\"" 에 해당하는  챗 ID를 가져올 수 있도록 하고 가장마지막으로 받은 챗 ID가 담기게 됨
			}
		});
	}
	function addChat(chatName, chatContent, chatTime) {
		$('#chatList').append('<div class="row">' + 
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +
				chatName +
				'<span class="small pull-right">' +
				chatTime + 
				'</span>' +
				'</h4>' +
				'<p>' +
				chatContent +
				'</p>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<hr>');	
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}			// Insertion of Chat Message by given structures above
	function getInfiniteChat() {	// 몇 초 간격으로 챗 내용물이 계속해서 새로운 메세지가 왔는지 가져오는 함수
		setInterval(function() {
			chatListFunction(lastID);
		}), 3000);		// 3초에 한번씩 실행 될 수 있게, for visualisation, see Line 161's script
	}
</script>
</head>
<body>
	

	<div>
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>야낚자 채팅방</h4>
						</div>
						<div clear="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">   <!-- JavaScript로 컨트롤 할수 있게  -->
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;"> <!-- Y축 오토를 줘서 스크롤바 생성 -->
						</div>
						<div class="portlet-footer">
							<!-- <div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="8"> 어떤사람이 채팅을 보내는지 이름을 적어보내주는 것
								</div>
							</div> 이름 부분 필요 없음 --> 
							<div class="row" style="height: 90px;">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="200"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">보내기</button>
									<div class="clearfix"></div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage" style="display: none;">
		<strong>메시지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display: none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
	</div>
	
	<%-- <% 
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		
	%> --%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			chatListFunction('ten');
			getInfiniteChat();
		});				// 3초 간격으로 챗 가져오는 스크립트
	</script>
</body>
</html>