package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_AddFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int num = 0;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) pageNum = "1";
			if(request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
				fishingsiteDao fsd = fishingsiteDao.getInstance();
				fishingsite fs = fsd.select(num);
			}
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		
		return "hs_addForm.jsp";
	}

}
