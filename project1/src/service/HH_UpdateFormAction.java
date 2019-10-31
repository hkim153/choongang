package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.Event;
import dao.EventDao;

public class HH_UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int e_id = Integer.parseInt(request.getParameter("e_id"));
			String pagenNum = request.getParameter("pagenNum");
			EventDao ed = EventDao.getInstance();
			Event event = ed.select(e_id);
			request.setAttribute("pagenNum", pagenNum);
			request.setAttribute("event", event);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hh_updateForm.jsp";
	}

}
