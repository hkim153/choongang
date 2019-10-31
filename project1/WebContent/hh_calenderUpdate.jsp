<%@page import="dao.EventDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%

		EventDao ed = EventDao.getInstance();
		JSONArray jsonArray = ed.getOnesoJSON();

%>

</head>
<body>

<%=jsonArray %>
<script type="text/javascript">
			alert("업데이트 완료");
			location.href = "hh_list.do";
		</script>

</body>
</html>