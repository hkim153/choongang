package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDto;
import dao.RankDao;

public class SJ_DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("sj_DeleteFormAction start");
			String id = request.getParameter("id");
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			RankDao rk = RankDao.getInstance();
			RankDto rank = rk.select(id);
			request.setAttribute("id", id);
			request.setAttribute("rank", rank);
			request.setAttribute("num", num);
			System.out.println("sj_DeleteFormAction end");
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "sj_deleteForm.jsp";
	}

}
