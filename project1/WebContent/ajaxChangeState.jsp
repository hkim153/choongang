<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>
<% 	
	StoreDao sd = StoreDao.getInstance();
	String id = (String)session.getAttribute("id");
	int state = Integer.parseInt(request.getParameter("state"));
	int buy_num = Integer.parseInt(request.getParameter("buy_num"));
	int changestate = sd.changestate(state,buy_num);
	Store selectstate = sd.selectstate(buy_num);
	out.print(selectstate.getState());     
  
%>