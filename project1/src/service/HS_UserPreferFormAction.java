package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Fish;
import dao.FishingsiteDao;

public class HS_UserPreferFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			FishingsiteDao fsd = FishingsiteDao.getInstance();
			//db에 저장된 모든 어종 보내버리기
			List<Fish> flist = fsd.get_all_fish();
			request.setAttribute("flist", flist);
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "hs_userPreferForm.jsp";
	}

}
