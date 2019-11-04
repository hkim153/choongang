package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.fish;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_AddProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			request.setCharacterEncoding("utf-8");
			
			String pageNum = request.getParameter("pageNum");
			fishingsite fs = new fishingsite();
			fs.setFs_num(Integer.parseInt(request.getParameter("num")));
			String fs_name = request.getParameter("fs_name");
			fs.setFs_name(fs_name);
			fs.setFs_addr(request.getParameter("fs_addr"));
			//이미지
			fs.setFs_content(request.getParameter("fs_content"));
			fs.setFs_reg(request.getParameter("fs_reg"));
			fs.setId(request.getParameter("id"));

			fishingsiteDao fsd = fishingsiteDao.getInstance();
			int result = fsd.insert(fs);
			
			String [] fishes = request.getParameterValues("어종");
			fsd.mappingfish(fishes, fs_name);
		    request.setAttribute("result", result);
		    request.setAttribute("pageNum", pageNum);
		}catch(Exception e) { System.out.println(e.getMessage()); }
		
		
		return "hs_addPro.jsp";
	}

}
