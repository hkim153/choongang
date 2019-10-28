<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*" 
    errorPage="../DBError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<%
	Context init = new InitialContext();
	DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	if (conn !=null) out.println("j20191002 연결 성공");
	else out.println("헐 ~ ㅠㅠ");
	conn.close();
%>
</body>
</html>