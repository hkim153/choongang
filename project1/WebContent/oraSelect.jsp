<%@page import="javax.sql.DataSource"%>
<%@page import="dao.Member"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String empno = request.getParameter("empno");
	String sql = "select id,name  from member1 where id='aa'";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	Member member = new Member();
	if(rs.next()){
		member.setId(rs.getString(1));
		member.setName(rs.getString(2));
		
	   System.out.println("id-> "+member.getId());
	   System.out.println("name-> "+member.getName());
	} else { out.print("없는 사원입니다.");
		stmt.close();
		conn.close();
	}
	


%>

</body>
</html>