package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.Event;
import dao.EventDao;

public class HH_DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//기본 게시판 요소
			int e_id = Integer.parseInt(request.getParameter("e_id"));
			String pageNum = request.getParameter("pageNum");		
			
			EventDao ed = EventDao.getInstance();
			Event event = ed.select(e_id);
			
			request.setAttribute("e_id", e_id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("event", event);
			
		} catch(Exception e) {	System.out.println(e.getMessage());	}
		
		
		return "hh_deleteForm.jsp";
	}

}
