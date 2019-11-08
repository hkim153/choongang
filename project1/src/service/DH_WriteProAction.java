package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.events.EventException;

import dao.Event;
import dao.EventDao;
import dao.RecruitBoard;
import dao.RecruitBoardDao;

public class DH_WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("--------------------------chk");
			
	        request.setCharacterEncoding("utf-8"); 
	        RecruitBoard recruitBoard = new RecruitBoard();
	        recruitBoard.setR_title(request.getParameter("r_title"));		
	        recruitBoard.setR_passwd(request.getParameter("r_passwd"));	
	        recruitBoard.setF_code(Integer.parseInt(request.getParameter("f_code")));	
	        recruitBoard.setR_goal(request.getParameter("r_goal"));	
	        recruitBoard.setR_timeset(request.getParameter("r_timeset"));
	        recruitBoard.setR_member(request.getParameter("r_member"));
	        recruitBoard.setDatepicker(request.getParameter("datepicker"));

	      
	        RecruitBoardDao rd = RecruitBoardDao.getInstance();//DB 
	        int result = rd.insert(recruitBoard);
	        request.setAttribute("num", recruitBoard.getR_num());
	        request.setAttribute("result", result);
	        
			 
	        Event event = new Event();
	        event.setTitle(request.getParameter("r_title"));
	        event.setUsername("사나");		
	        event.setE_type("모임");		
	        event.setTextColor("#74c0fc");	
	        event.setBackgroundColor("#ffffff");
	        event.setE_start(request.getParameter("datepicker"));
	        event.setE_end(request.getParameter("datepicker"));
	        String eds = request.getParameter("r_timeset");
	        switch (eds) {
			case "num1":
				eds = "3시간 이상 모임";
				break;
			case "num2":
				eds = "6시간 이상 모임";
				break;
			case "num3":
				eds = "12시간 이상 모임";
				break;
			case "num4":
				eds = "하루 이상 모임";
				break;
			case "num5":
				eds = "3일 이상 모임";
				break;
			case "num6":
				eds = "일주일 이상 모임";
				break;

			default:
				eds = "상세 사항 참조";
				
				break;
			}
	        event.setDescription(eds);
	        event.setAllDay("true");
	        event.setRsa("협의");
	        
	        String a= "/project1/dh_recruit_content.do?recruit_num="+recruitBoard.getR_num()+"&room_manager=aa";
			event.setUrl(a);
			EventDao ed = EventDao.getInstance();//DB 
	        int result2 = ed.insert(event);
	        request.setAttribute("num2",event.getE_id());
	        System.out.println("Event DB"+event.getE_id()+"번 입력 성공");
	       
		} 

		
		catch(Exception e) { System.out.println(e.getMessage()); }
        return "dh_writePro.jsp";
	}
}