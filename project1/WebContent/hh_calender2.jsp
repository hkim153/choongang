<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">
    <link href="test.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='vendor/css/select2.min.css' />
    <link rel="stylesheet" href='vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div class="wrap">
		<header>
			<c:choose>
				
					<c:when	test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">	<!-- 로그인값, 어드민권한 둘다 있을때  -->
						<p align="right"><a href="hh_index.jsp">이동하기</a></p>
					</c:when>
				</c:choose>
		
		
					
					
			
		</header>
		
    <div class="container">
        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div> 
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>
            <div class="panel-body">
                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                             <option value="지역 행사" style="color: #4d638c;">지역 행사</option>
                            <option value="개인 행사" style="color: #4d638c;">개인 행사</option>
                            <option value="대회" style="color: #4d638c;">대회</option>
                            <option value="모임" style="color: #4d638c">모임</option>
                            <option value="기타" style="color: #4d638c;">기타</option>
                        </select>
                    </div>
                </div>
               <div class="col-lg-6">
                    <label for="calendar_view"></label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>행사 숨기기</label>        
                    </div>               
                </div> 
            </div>
        </div>
    </div>
    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
    <script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/etcSetting.js"></script>
    </div>

</body>
</html>