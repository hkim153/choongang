package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Chat;
import dao.ChatDao;
import dao.Recruit;
import dao.RecruitDao;
import dao.StoreDao;
import dao.jw_MemberDao;
import dao.jw_MemberDto;

public class DH_RecruitProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); // 세션 선언
		request.setCharacterEncoding("utf-8");
		
		String recruit_title = request.getParameter("Recruit_title");
		String recruit_id = request.getParameter("Recruit_id");
		String recruit_passwd = request.getParameter("Recruit_passwd");
		String recruit_species= request.getParameter("Recruit_species");
		String recruit_goal= request.getParameter("Recruit_goal");
		String recruit_timeset= request.getParameter("Recruit_timeset");
		int recruit_member= Integer.parseInt(request.getParameter("Recruit_member"));
		String recruit_event= request.getParameter("Recruit_event");
		
		
		System.out.println("1 : " + recruit_title);
		System.out.println("2 : " + recruit_id);
		System.out.println("3 : " + recruit_passwd);
		System.out.println("4 : " + recruit_species);
		System.out.println("5 : " + recruit_goal);
		System.out.println("6 : " + recruit_timeset);
		System.out.println("7 : " + recruit_member);
		System.out.println("8 : " + recruit_event);
		
		Recruit recruit = new Recruit();
		recruit.setRecruit_title(recruit_title);
		recruit.setId(recruit_id);
		recruit.setRecruit_passwd(recruit_passwd);
		recruit.setRecruit_species(recruit_species);
		recruit.setRecruit_goal(recruit_goal);
		recruit.setRecruit_timeset(recruit_timeset);
		recruit.setRecruit_member(recruit_member);
		recruit.setRecruit_event(recruit_event);
		
		String newroom = "방 생성 완료";
		Chat chat = new Chat();
		chat.setRoom_manager(recruit_id);
		chat.setChatContent(newroom);
		RecruitDao rd = RecruitDao.getInstance();
		ChatDao cd = ChatDao.getInstance();
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		try {
			result = rd.insert_recruit(recruit);
			result2 = cd.chatRoom(chat);
			result3 = cd.participantlist(chat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		request.setAttribute("result", result);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		return "dh_recruitPro.jsp";
	}

}
