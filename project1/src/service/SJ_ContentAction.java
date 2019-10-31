package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDto;
import dao.RankDao;

public class SJ_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("id");
			
			RankDao rk = RankDao.getInstance();
			
			RankDto rank = rk.select(id);
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("rank", rank);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "sj_content.jsp";
	}

}
