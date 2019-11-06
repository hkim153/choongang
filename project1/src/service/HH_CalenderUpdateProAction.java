package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import dao.Event;
import dao.EventDao;

public class HH_CalenderUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Event event = new Event();	
			EventDao ed = EventDao.getInstance();
			JSONArray jsonArray = ed.getOnesoJSON();
			int result = ed.delpast();
			


		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hh_calenderUpdate.jsp";
	}

}
