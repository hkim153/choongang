package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDao;
import dao.RankDto;
public class SJ_RegFormAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			System.out.println("sj_regformaction");			
			int num=0;
			String id = request.getParameter("id");
			System.out.println("id->"+id);
			String get_fish = request.getParameter("get_fish");
			System.out.println("get_fish->"+get_fish);
			int length=Integer.parseInt(request.getParameter("length"));
			System.out.println("length->"+length);
			String content = request.getParameter("content");
			System.out.println("content->"+content);
			String img = request.getParameter("img");
			System.out.println("img->"+img);
			RankDto rank = new RankDto();
			rank.setNum(num);
			
			if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			RankDao rk = RankDao.getInstance();
			
			//RankDto rank= rk.insert(num); 
			int result = rk.insert(rank);
			
			}
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("get_fish",get_fish );
			request.setAttribute("length", length);
			request.setAttribute("content", content);
			request.setAttribute("img", img);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		

		return "sj_regForm.jsp";
	}

}
