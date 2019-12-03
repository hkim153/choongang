<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="service.CommandProcess" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp"%>
<%!  
public String getTen(int recruit_num, String room_manager) {
	StringBuffer result = new StringBuffer("");
	result.append("{\"result\":[");
	ChatDao chatdao = ChatDao.getInstance();
	ArrayList<Chat> chatList = chatdao.getChatListByRecent(recruit_num, room_manager, 10);
	if(chatList.size() == 0) return "";
	for(int i = 0; i <chatList.size(); i++) {
		result.append("[{\"value\": \""+ chatList.get(i).getFromID()+"\"},");
		result.append("{\"value\": \""+ chatList.get(i).getChatContent()+"\"},");
		result.append("{\"value\": \""+ chatList.get(i).getChatTime()+"\"}]");
		if( i != chatList.size() -1) result.append(",");
	}
	result.append("], \"last\":\""+chatList.get(chatList.size()-1).getChatID()+"\"}");
	return result.toString();
}

public String getID(int recruit_num, String room_manager, String chatID) {
	StringBuffer result = new StringBuffer("");
	result.append("{\"result\":[");
	ChatDao chatdao = ChatDao.getInstance();
	ArrayList<Chat> chatList = chatdao.getChatListByID(recruit_num, room_manager, chatID);
	if(chatList.size() == 0) return "";
	for(int i = 0; i <chatList.size(); i++) {
		result.append("[{\"value\": \""+ chatList.get(i).getFromID()+"\"},");
		result.append("{\"value\": \""+ chatList.get(i).getChatContent()+"\"},");
		result.append("{\"value\": \""+ chatList.get(i).getChatTime()+"\"}]");
		if( i != chatList.size() -1) result.append(",");
	}
	result.append("], \"last\":\""+chatList.get(chatList.size()-1).getChatID()+"\"}");
	return result.toString();
}

%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	ChatDao chatdao = ChatDao.getInstance();
	int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
	String fromID = request.getParameter("fromID");
	String room_manager = request.getParameter("room_manager");
	String listType = request.getParameter("listType");
	//System.out.println("AjaxChatList listType : "+listType);
	if (fromID == null || fromID.equals("") || room_manager == null || room_manager.equals("") || listType == null
			|| listType.equals("")) {
		response.getWriter().write("");
	} else if (listType.equals("ten"))
		response.getWriter()
				.write(getTen(recruit_num, URLDecoder.decode(room_manager, "UTF-8")));
	else {
		try {
			response.getWriter().write(
					getID(recruit_num, URLDecoder.decode(room_manager, "UTF-8"), listType));
		} catch (Exception e) {
			response.getWriter().write("");
		}
	}
	//System.out.println("AjaxChatList END.....");

%>