<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDao md = MemberDao.getInstance();
	String id = request.getParameter("id");
	//String alive_c ="1";
	System.out.println("numCheckAjax   id->" + id);
	//String alive_c = request.getParameter("alive_c");
	int result = md.confirm(id);
	int aliveResult = md.confirm_Alive(id);
	if (aliveResult == 1) {
		System.out.println("numCheckAjax  aliveResult->" + aliveResult);
		// 이미 사용중인 아이디입니땅!
		out.println("1");
	} else {
		System.out.println("numCheckAjax  aliveResult->" + aliveResult);
		// 사용할수있는 아이디입니땅!
		out.println("0"	);
		}
	/* 	if(result ==0){
		out.println("사용할 수 있는 ID입니다^ㅡ^");
	} else {
		out.println("이미 있는 아이디입니다.");
	} */
%>


