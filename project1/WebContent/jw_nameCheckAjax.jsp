<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDao md = MemberDao.getInstance();
	String id = request.getParameter("id");
	System.out.println("numCheckAjax   id->" + id);
	int aliveResult = md.confirm_Alive(id);
	if (aliveResult == 1) {		
		out.println("1");
		// aliveResult = 1이면 1을 보냄
	} else {		
		out.println("0");
		// aliveResult != 1이면 0을 보냄
	}
%>


