package service;

import java.io.IOException;
import java.util.List;

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
			String imagefile = "/fishingsite_img";
			String realPath = request.getServletContext().getRealPath(imagefile);
			fsd.readCount(num);
			fishingsite fs = fsd.select(num);
			List<String> fishes = fsd.get_fish(num);
			request.setAttribute("fishes", fishes);
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("fs", fs);
			request.setAttribute("realPath", realPath);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs_content.jsp";
	}

}
