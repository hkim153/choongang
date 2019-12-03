<%@page import="java.net.URLDecoder"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>
<% 	 
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			ChatDao chatdao = ChatDao.getInstance();
			int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
			String fromID = request.getParameter("fromID");
			String chatContent = request.getParameter("chatContent");
			String room_manager = request.getParameter("room_manager");
			if(fromID == null || fromID.equals("") || chatContent == null || chatContent.equals("")){
				response.getWriter().write(0);
			} else {
				recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
				fromID = URLDecoder.decode(fromID,"UTF-8");
				room_manager = URLDecoder.decode(room_manager,"UTF-8");
				chatContent = URLDecoder.decode(chatContent, "UTF-8");
				response.getWriter().write(chatdao.submit(recruit_num, room_manager, fromID,chatContent)+"");
			} 
  
%>