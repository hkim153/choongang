package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChatDao;

public class DH_RecruitChat_inAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ChatDao chatdao = ChatDao.getInstance();
		HttpSession session =  request.getSession(true);
		session.setAttribute("userID", session.getAttribute("id"));
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		String room_manager = request.getParameter("room_manager");
		
		int chatroom_in = chatdao.chatroom_in(recruit_num, (String)session.getAttribute("id"), room_manager);
		System.out.println("챗룸_인: "+chatroom_in);
		System.out.println("recruit_num: "+recruit_num);
		System.out.println("(String)session.getAttribute(\"id\"): "+(String)session.getAttribute("id"));
		System.out.println("room_manager: "+room_manager);
		// chatroom_in 채팅방 입장 클릭 시 해당 채팅방에서 해당 아이디 검색 후 없을시 채팅방 참여명단에 추가 해주는 코드
		
		request.setAttribute("chatroom_in", chatroom_in);
		request.setAttribute("recruit_num", recruit_num);
		request.setAttribute("room_manager", room_manager);
		return "dh_recruitChat.jsp";
	}

}
