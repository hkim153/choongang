package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Event;
import dao.EventDao;

public class HH_UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			Event event = new Event();
			event.setE_id(Integer.parseInt(request.getParameter("e_id")));
			event.setTitle(request.getParameter("title"));
			event.setDescription(request.getParameter("description"));
			event.setE_start(request.getParameter("e_start"));
			event.setE_end(request.getParameter("e_end"));
			event.setE_type(request.getParameter("e_type"));
			event.setRsa(request.getParameter("rsa"));
			
			EventDao ed = EventDao.getInstance();
			int result = ed.update(event);
			request.setAttribute("result", result);
			request.setAttribute("e_id", event.getE_id());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hh_updatePro.jsp";
	}

}
