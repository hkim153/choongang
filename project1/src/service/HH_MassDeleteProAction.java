package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Event;
import dao.EventDao;

public class HH_MassDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//기본 게시판 요소
			String[] e_ida  = request.getParameterValues("delf");	
			String pageNum = request.getParameter("pageNum");
			System.out.println("e_ida.length ->" + e_ida.length);
			for (int i = 0; i < e_ida.length; i++) {
				System.out.println(e_ida[i]);
			}
			
			
			
			EventDao ed = EventDao.getInstance();
			int result = ed.masdel(e_ida);
			
			request.setAttribute("e_ida", e_ida);
			request.setAttribute("pageNum", pageNum);	
			request.setAttribute("result", result);

			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "hh_masdelet.jsp";
	}

}
