package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DH_RecruitChat_inAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session =  request.getSession(true);
		session.setAttribute("userID", session.getAttribute("id"));
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		String room_manager = request.getParameter("room_manager");
		request.setAttribute("recruit_num", recruit_num);
		request.setAttribute("room_manager", room_manager);
		return "dh_recruitChat.jsp";
	}

}
