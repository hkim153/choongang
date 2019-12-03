package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Fish;
import dao.Fishingsite;
import dao.FishingsiteDao;

public class HS_UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			FishingsiteDao fsd = FishingsiteDao.getInstance();
			//현재 낚시터 정보 가져오기
			Fishingsite fs = fsd.select(num);
			//db에 있는 모든 어종 가져오기
			List<Fish> flist = fsd.get_all_fish();
			//현재 낚시터에 서식하는 어종 가져오기
			List<String> fishes = fsd.get_fish(num);
			
			request.setAttribute("fishes", fishes);
			request.setAttribute("flist", flist);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("fs", fs);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hs_updateForm.jsp";
	}

}
