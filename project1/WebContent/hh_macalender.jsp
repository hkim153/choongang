<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">

 <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
<!--  두번째 -->
   <link rel="stylesheet" href="vendor/css/bootstrap.min.css">
<style type="text/css">
.fc-day-grid{
pointer-events: none;
cursor: default;

}
h2 {
font-size: x-large;
}




</style>

</head>

<body>
    <div class="container">

            <div id="calendar"></div>
            <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>행사 표시</label> 
  
                    </div>        
            

    </div>

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
	<script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
 	<script src="js/mai.js"></script>
    <script src="js/etcSetting.js"></script>

</body>

</html>