package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Recruit;
import dao.RecruitDao;
import dao.Fish;

public class DH_UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));

			
			RecruitDao rd = RecruitDao.getInstance();
			Recruit recruit = rd.recruit_content(recruit_num);
			List<Fish> f_species = rd.f_species();
			request.setAttribute("f_species", f_species);
			request.setAttribute("recruit", recruit);
			
			
		}catch(Exception e) {	
			System.out.println(e.getMessage());	
		}
		

		return "dh_updateForm.jsp";
	}

}
