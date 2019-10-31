package service;

import java.io.IOException;

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
			int num = 0;
			if (request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
				EventDao ed = EventDao.getInstance();
				Event event = ed.select(num);
				//권한 토스 토대 - 실 사용X
				
			}
			request.setAttribute("num", num);
	
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		
		return "hh_index.html";
	}

}
