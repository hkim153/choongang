<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function submitFunction() {
			var recruit_num = '${recruit_num}';
			var room_manager = '${room_manager}';
			var fromID = '${sessionScope.id}';
			var chatContent = $('#chatContent').val();
			$.ajax({
				type:"post",
				url:"AjaxChatSubmit.jsp",
				data:{
					recruit_num : recruit_num,
					room_manager : encodeURIComponent(room_manager),
					fromID : encodeURIComponent(fromID),
					chatContent:encodeURIComponent(chatContent)
				},
				success:function(result){
				}
			});
			$('#chatContent').val('');
		}
		var lastID = 0; 
		function chatListFunction(type){
			var recruit_num = '${recruit_num}';
			var fromID = '${sessionScope.id}';
			var room_manager = '${room_manager}';
			$.ajax({
				type:'POST',
				url:"AjaxChatList.jsp",
				data:{
					recruit_num : recruit_num,
					fromID : encodeURIComponent(fromID),
					room_manager : encodeURIComponent(room_manager),
					listType: type
				},
				success:function(data){
					if(data == "") return;
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i = 0; i< result.length; i++){
						if(result[i][0].value== fromID){
							result[i][0].value='나';
							
						}
						addChat(result[i][0].value, result[i][1].value, result[i][2].value);
					}
					lastID = Number(parsed.last);
				}
			}); 
		}
		function addChat(chatName, chatContent, chatTime){
			$('#chatList').append('<div class="row">'+
					'<div class="col-lg-12">'+
					'<div class="media">'+
					'<a class="pull-left" href="#">'+
					'<img class="media-object img-circle" style="width:30px; height:30px;" src="images/icon.png" alt="">'+
					'</a>'+
					'<div class="media-body">'+
					'<h4 class="media-heading">'+
					chatName +  
					'<span class="small pull-right">'+
					chatTime +
					'</span>'+
					'</h4>'+
					'<p>'+
					chatContent+
					'</p>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'<hr>');
			$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
		}
		 function getInfiniteChat(){
			setInterval(function(){
				chatListFunction(lastID);
			}, 3000);
		} 
	</script>
	<title>실시간 회원제 채팅 서비스</title>
</head>
<body>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
						</div>
						<div class="portlet-footer">
							<div class="row" style="height: 90px;">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea> 
								</div>
							</div>
							<div class="form-group col-xe-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			chatListFunction('ten');
			getInfiniteChat();
			});
	</script>
</body>
</html>