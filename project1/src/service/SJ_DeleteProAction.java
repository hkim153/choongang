package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDao;
import dao.Rank;

public class SJ_DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("DeleteProAction start");
			request.setCharacterEncoding("utf-8");
			int num = Integer.parseInt(request.getParameter("num"));
			Rank rank = new Rank();
			RankDao rk = RankDao.getInstance();
			int result = rk.delete(num);
			System.out.println("DeleteProAction result->"+result);
			request.setAttribute("result", result);
			request.setAttribute("num", num);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		
		return "sj_deletePro.jsp";
	}

}
