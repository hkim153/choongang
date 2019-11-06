package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Event;
import dao.EventDao;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HH_WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		try {
	        request.setCharacterEncoding("utf-8"); 
	        String urldmy = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=";
	        Event event = new Event();
	        String [] arr = {"서울","인천","경기","강원","충청","대전","전라","전라","전라","경상","대구","부산","제주"};
	        int ck1 = 1;
	        for (int i = 0; i < arr.length; i++) {
				if (arr[i].equals(request.getParameter("eventpin"))) {
					ck1 = 0;
					System.out.println("insert for chk ->"+request.getParameter("eventpin"));
					break;
				}
			}
	        event.setUsername(request.getParameter("username"));		
	        event.setE_type(request.getParameter("e_type"));	
	        event.setTitle(request.getParameter("title"));	
	        event.setTextColor(request.getParameter("textColor"));	
	        event.setBackgroundColor(request.getParameter("backgroundColor"));
	        event.setE_start(request.getParameter("e_start"));
	        event.setE_end(request.getParameter("e_end"));
	        event.setDescription(request.getParameter("description"));
	        event.setAllDay(request.getParameter("allday"));
	        event.setRsa(request.getParameter("eventpin"));
	        if (request.getParameter("url").equals("")) {
	        	 if (ck1==0) {
	        		 event.setUrl(urldmy+request.getParameter("title"));
				}else if (ck1==1) {	
					fishingsiteDao fsd = fishingsiteDao.getInstance();
					fishingsite c = fsd.select2(event.getRsa());	
					int b= c.getFs_num(); 
					System.out.println("fishingsite1.getFs_num()->"+c.getFs_num()+"&&"+b);
					String a= "/project1/hs_content.do?num="+b+"&pageNum=1";
					event.setUrl(a);
				}
			}else {
				event.setUrl(request.getParameter("url"));
			}
	        
	        
	        EventDao ed = EventDao.getInstance();//DB 
	        int result = ed.insert(event);
	        request.setAttribute("num", event.getE_id());
	        request.setAttribute("result", result);
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "hh_writePro.jsp";
	}
}