package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Event;
import dao.EventDao;

public class HH_WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        System.out.println("WH_WriteProAction start..." );		

		try {
	        request.setCharacterEncoding("utf-8"); 
	        Event event = new Event();
	        event.setUsername(request.getParameter("username"));		
	        event.setE_type(request.getParameter("e_type"));	
	        event.setTitle(request.getParameter("title"));	
	        event.setTextColor(request.getParameter("textColor"));	
	        event.setBackgroundColor(request.getParameter("backgroundColor"));
	        event.setE_start(request.getParameter("e_start"));
	        event.setE_end(request.getParameter("e_end"));
	        event.setDescription(request.getParameter("description"));
	        event.setAllDay(request.getParameter("allday"));
	      
	        
	        EventDao ed = EventDao.getInstance();//DB 
	        int result = ed.insert(event);
	        request.setAttribute("num", event.getE_id());
	        request.setAttribute("result", result);
	        System.out.println("WH_WriteProAction result->"  + result);		
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "hh_writePro.jsp";
	}
}