package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Recruit;
import dao.RecruitDao;

public class DH_RecruitContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecruitDao rd = RecruitDao.getInstance();
		try { 
			    int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
				Recruit recruit = rd.recruit_content(recruit_num);
				request.setAttribute("recruit", recruit);
				
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "dh_recruitContent.jsp";
	}

}
