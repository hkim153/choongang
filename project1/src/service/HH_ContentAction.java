package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Event;
import dao.EventDao;

public class HH_ContentAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//기본 게시판 요소
			int e_id = Integer.parseInt(request.getParameter("e_id"));	
			String pageNum = request.getParameter("pageNum");
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String e_start = request.getParameter("e_start");
			String e_end = request.getParameter("e_end");
			String e_type = request.getParameter("e_type");
			String rsa = request.getParameter("rsa");
			String url = request.getParameter("url");
			
			EventDao ed = EventDao.getInstance();
			Event event = ed.select(e_id);
			request.setAttribute("event", event);
			request.setAttribute("e_id", e_id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("title", title);
			request.setAttribute("description", description);
			request.setAttribute("e_start", e_start);
			request.setAttribute("e_end", e_end);
			request.setAttribute("e_type", e_type);
			request.setAttribute("rsa", rsa);
			request.setAttribute("url", url);
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hh_content.jsp";
	}
}
