package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.fish;
import dao.fishingsiteDao;

public class HS_UserPreferFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			fishingsiteDao fsd = fishingsiteDao.getInstance();
			List<fish> flist = fsd.get_all_fish();
			request.setAttribute("flist", flist);
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "hs_userPreferForm.jsp";
	}

}
