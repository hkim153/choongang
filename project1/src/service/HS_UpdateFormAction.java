package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.fish;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			fishingsiteDao fsd = fishingsiteDao.getInstance();
			fishingsite fs = fsd.select(num);
			List<fish> flist = fsd.get_all_fish();
			
			request.setAttribute("flist", flist);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("fs", fs);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hs_updateForm.jsp";
	}

}
