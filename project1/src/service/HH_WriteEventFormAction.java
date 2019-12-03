package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Event;
import dao.EventDao;

public class HH_WriteEventFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//기본 게시판 요소
			
				String chk = request.getParameter("chk");
				EventDao ed = EventDao.getInstance();
				List<Event> list = ed.list();	
				request.setAttribute("list", list);
				request.setAttribute("chk", chk);
		
	
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		
		return "hh_writeEventForm.jsp";
	}

}
