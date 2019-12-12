<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script  type="text/javascript"  src="WebContent/views/js/jquery-1.9.1.js"> </script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
//floating menu
//[CDATA[
var name = "#floatMenu";
var menuYloc = null;

$(document).ready(
		function() {
			menuYloc = parseInt($(name).css("top").substring(0,
					$(name).css("top").indexOf("px")));
			$(window).scroll(function() {
				offset = menuYloc + $(document).scrollTop() + "px";
				$(name).animate({
					top : offset
				}, {
					duration : 700,
					queue : false
				});
			});
		});
//
</script>
<script>
document.oncontextmenu=function(){return false;};
</script>
</head>
<body>
<!-- 마켓 대화 창 플로트 -->
	 <div id="floatMenu">
		<ul>
			<li><a class="fm_1" href="main.do"><img src="images/float_logo.png" alt="메인으로"></a></li>
			<li><a class="fm_4" href="#top"><img src="images/top_btn.png" alt="맨위로"></a></li>
			<li><a class="fm_5" href="#footer"><img src="images/down_btn.png" alt="맨아래로"></a></li>
		</ul>
	</div>
</body>
</html>