package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int num = Integer.parseInt(request.getParameter("num"));	
			String pageNum = request.getParameter("pageNum");
			fishingsiteDao fsd = fishingsiteDao.getInstance();
			fsd.readCount(num);
			fishingsite fs = fsd.select(num);
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("fs", fs);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs_content.jsp";
	}

}
