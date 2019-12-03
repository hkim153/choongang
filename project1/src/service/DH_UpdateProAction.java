package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Event;
import dao.EventDao;
import dao.Recruit;
import dao.RecruitDao;

public class DH_UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		String recruit_title = request.getParameter("recruit_title");
		String recruit_id = request.getParameter("recruit_id");
		String recruit_species = request.getParameter("recruit_species");
		String recruit_goal = request.getParameter("recruit_goal");
		String recruit_timeset = request.getParameter("recruit_timeset");
		int recruit_member = Integer.parseInt(request.getParameter("recruit_member"));
		String recruit_event = request.getParameter("recruit_event");
		String [] re_evArr = recruit_event.split(" ");
		int e_id = Integer.parseInt(request.getParameter("recruit_e_id"));
		
		System.out.println("e_id 123- > " + e_id);
		
		Recruit recruit = new Recruit();
		
		recruit.setRecruit_num(recruit_num);
		recruit.setRecruit_title(recruit_title);
		recruit.setId(recruit_id);
		recruit.setRecruit_species(recruit_species);
		recruit.setRecruit_goal(recruit_goal);
		recruit.setRecruit_timeset(recruit_timeset);
		recruit.setRecruit_member(recruit_member);
		recruit.setRecruit_event(re_evArr[0]);

		
		RecruitDao rd = RecruitDao.getInstance();
		EventDao ed = EventDao.getInstance();//DB 
		int result = 0;
		int result2 = 0;
		
		Event event = new Event();
		event.setE_id(e_id);
        event.setTitle(recruit_title);
        String [] rea = re_evArr[0].split("/");
        String re = "";
        for (int i = 0; i < rea.length; i++) {
			re += rea[i];
			if (i==3||i==5) {
				re += "-";
			}
		}
        event.setE_start(re);
        event.setE_end(re);
		
		try {
			result = rd.update(recruit);
			result2 = ed.update2(event);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("result", result);
	
		return "dh_updatePro.jsp";
	}

}
