package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Fishingsite;
import dao.FishingsiteDao;

public class HS_DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");		
			
			FishingsiteDao fsd = FishingsiteDao.getInstance();
			//현재 게시글의 작성자를 알기위해서 select문으로 찾고 넘김
			Fishingsite fs = fsd.select(num);
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("fs", fs);
			
		} catch(Exception e) {	System.out.println(e.getMessage());	}
		
		
		return "hs_deleteForm.jsp";
	}

}
