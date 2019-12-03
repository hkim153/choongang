package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;

public class DH_DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
			RecruitDao rd = RecruitDao.getInstance();
			
			
			int result2 = rd.deleteEvent(recruit_num);
			
			int result = rd.delete(recruit_num);
			request.setAttribute("result", result);
			request.setAttribute("recruit_num", recruit_num);
		} catch (Exception e) { System.out.println(e.getMessage()); }
        return "dh_deletePro.jsp";
	}

}
