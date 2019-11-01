package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_UserPreferProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String [] regions = request.getParameterValues("지역");
			String [] fishes = request.getParameterValues("어종");
			
			fishingsiteDao fsd = fishingsiteDao.getInstance();
			List<fishingsite> fslist = fsd.find_fs_code(regions, fishes);
			
			request.setAttribute("fslist", fslist);
		}catch(Exception e) {System.out.println(e.getMessage());}
	
		return "hs_userPreferPro.jsp";
	}

}
