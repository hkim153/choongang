package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Event;
import dao.EventDao;

public class DH_DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		try {
			System.out.println("삭제번호 : "+ recruit_num);
			request.setAttribute("recruit_num", recruit_num);
			
		} catch(Exception e) {	System.out.println(e.getMessage());	}
		
		
		return "dh_deleteForm.jsp";
	}

}
