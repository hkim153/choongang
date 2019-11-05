package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Event;
import dao.EventDao;
import dao.RecruitBoard;
import dao.RecruitBoardDao;

public class DH_WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
	        request.setCharacterEncoding("utf-8"); 
	        RecruitBoard recruitBoard = new RecruitBoard();
	        recruitBoard.setR_title(request.getParameter("r_title"));		
	        recruitBoard.setR_passwd(request.getParameter("r_passwd"));	
	        recruitBoard.setF_code(Integer.parseInt(request.getParameter("f_code")));	
	        recruitBoard.setR_goal(request.getParameter("r_goal"));	
	        recruitBoard.setR_timeset(request.getParameter("r_timeset"));
	        recruitBoard.setR_member(request.getParameter("r_member"));
	        recruitBoard.setDatepicker(request.getParameter("datepicker"));

	      
	         System.out.println("err chk1");
	        RecruitBoardDao rd = RecruitBoardDao.getInstance();//DB 
	        System.out.println("err chk2");
	        int result = rd.insert(recruitBoard);
	        System.out.println("err chk3");
	        request.setAttribute("num", recruitBoard.getR_num());
	        request.setAttribute("result", result);
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "dh_writePro.jsp";
	}
}