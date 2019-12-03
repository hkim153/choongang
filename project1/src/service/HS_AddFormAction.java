package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.Fish;
import dao.Fishingsite;
import dao.FishingsiteDao;

public class HS_AddFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) pageNum = "1";
			
			FishingsiteDao fsd = FishingsiteDao.getInstance();
			List<Fish> flist = fsd.get_all_fish();
			
			request.setAttribute("flist", flist);
			request.setAttribute("pageNum", pageNum);
			
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		
		return "hs_addForm.jsp";
	}

}
