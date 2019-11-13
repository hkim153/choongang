<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>
	#upright{
			position: absolute;
   			top: 0px;
   			right: 0px;
   			border-style:solid;
	}
</style>
<script src="./js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    //최상단 체크박스 클릭    
    $("#checkall1").click(function(){
        //클릭되었으면
        if($("#checkall1").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=rcheck]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=rcheck]").prop("checked",false);
        }
    })

})

$(document).ready(function(){
    //최상단 체크박스 클릭    
    $("#checkall2").click(function(){
        //클릭되었으면
        if($("#checkall2").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=fcheck]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=fcheck]").prop("checked",false);
        }
    })

})

</script>
</head>
<body>
<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
<form action = "hs_userPreferPro.do" method = "get">
	<table border = "1">
		<caption><h2>나에게 딱맞는 낚시터가 있다?!?!</h2></caption>
		<tr><td>지역</td><td>
		<input type = "checkbox"  id="checkall1">모두 체크<br>
		<input type = "checkbox" name = "rcheck" value = "서울특별시">서울특별시
		<input type = "checkbox" name = "rcheck" value = "경기도">경기도
		<input type = "checkbox" name = "rcheck" value = "인천광역시">인천광역시
		<input type = "checkbox" name = "rcheck" value = "강원도">강원도
		<input type = "checkbox" name = "rcheck" value = "충청북도">충청북도
		<input type = "checkbox" name = "rcheck" value = "충청남도">충청남도
		<input type = "checkbox" name = "rcheck" value = "세종특별자치시">세종특별자치시
		<input type = "checkbox" name = "rcheck" value = "대전광역시">대전광역시<br>
		<input type = "checkbox" name = "rcheck" value = "전라북도">전라북도
		<input type = "checkbox" name = "rcheck" value = "전라남도">전라남도
		<input type = "checkbox" name = "rcheck" value = "광주광역시">광주광역시
		<input type = "checkbox" name = "rcheck" value = "제주특별자치도">제주특별자치도
		<input type = "checkbox" name = "rcheck" value = "대구광역시">대구광역시
		<input type = "checkbox" name = "rcheck" value = "경상북도">경상북도
		<input type = "checkbox" name = "rcheck" value = "경상남도">경상남도
		<input type = "checkbox" name = "rcheck" value = "울산광역시">울산광역시
		<input type = "checkbox" name = "rcheck" value = "부산광역시">부산광역시
		<tr><td>어종</td>
		<td>
			<input type = "checkbox"  id="checkall2">모두 체크<br>
			<c:forEach var = "fish" items = "${flist }">
				<input type = "checkbox" name = "fcheck" value = "${fish.f_name }">${fish.f_name }
			</c:forEach>
			
		</td>
		<tr><td>
		<input type = "submit" value = "확인">
		</td>
		<td>
		<input type = "reset" value = "다시하기">
	</table>

</form>

<jsp:include page="footer.jsp"></jsp:include>

		</div>
</body>
</html>