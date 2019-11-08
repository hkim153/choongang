package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HH_CalenderAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
				
		return "hh_calender.jsp";


	}
}
