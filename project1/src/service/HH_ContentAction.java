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
			int e_id = Integer.parseInt(request.getParameter("e_id"));	
			String pageNum = request.getParameter("pageNum");
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String type = request.getParameter("type");
			
			EventDao ed = EventDao.getInstance();
			Event event = ed.select(e_id);
			request.setAttribute("event", event);
			request.setAttribute("e_id", e_id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("title", title);
			request.setAttribute("description", description);
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			request.setAttribute("type", type);
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hh_content.jsp";
	}
}
