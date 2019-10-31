package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDao;
import dao.RankDto;

public class SJ_RegProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			request.setCharacterEncoding("utf-8");
			int num=1;
			String id = request.getParameter("id");
			String get_fish = request.getParameter("get_fish");
			int length = Integer.parseInt(request.getParameter("length"));
			String content = request.getParameter("content");
			String img = request.getParameter("img");
			
			RankDto rank = new RankDto();
			rank.setNum(num);
			rank.setId(id);
			rank.setGet_fish(get_fish);
			rank.setLength(length);
			rank.setContent(content);
			rank.setImg(img);
	
			RankDao rk = RankDao.getInstance();
			int result = rk.insert(rank);
	
			System.out.println("result111->"+result);
			
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("get_fish", get_fish );
			request.setAttribute("length", length);
			request.setAttribute("content", content);
			request.setAttribute("img", img);
			request.setAttribute("result", result);

		}catch(Exception e) { System.out.println(e.getMessage()); }
		
		return "sj_regPro.jsp";
	}

}
