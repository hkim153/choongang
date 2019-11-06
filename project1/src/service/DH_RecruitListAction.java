package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Recruit;
import dao.RecruitDao;

public class DH_RecruitListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecruitDao rd = RecruitDao.getInstance();
		try { 
			    
				List<Recruit> list = rd.recruit_list();	
			    System.out.println("list.size()->" + list.size());	
				request.setAttribute("list", list);
				
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "dh_recruitList.jsp";
	}

}
