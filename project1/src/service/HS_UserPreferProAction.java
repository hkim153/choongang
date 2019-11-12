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
			String [] regions = request.getParameterValues("rcheck");
			String [] fishes = request.getParameterValues("fcheck");
			System.out.println("어종 체크 ");
			
			for(String cf : fishes) {
				System.out.println(cf);
			}
			fishingsiteDao fsd = fishingsiteDao.getInstance();
			List<fishingsite> fslist = fsd.find_fs_code(regions, fishes);
			
			request.setAttribute("fslist", fslist);
		}catch(Exception e) {System.out.println(e.getMessage());}
	
		return "hs_userPreferPro.jsp";
	}

}
