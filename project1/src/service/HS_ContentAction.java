package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Fishingsite;
import dao.FishingsiteDao;

public class HS_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//낚시터 게시글 번호
			int num = Integer.parseInt(request.getParameter("num"));	
			String pageNum = request.getParameter("pageNum");
			FishingsiteDao fsd = FishingsiteDao.getInstance();
			//이미지 띄우기 위해서 real path 가져오기
			String imagefile = "/fishingsite_img";
			String realPath = request.getServletContext().getRealPath(imagefile);
			//조회수 증가
			fsd.readCount(num);
			//낚시터 정보 가져오기
			Fishingsite fs = fsd.select(num);
			//해당 낚시터에 서식하는 어종 가져오기
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
