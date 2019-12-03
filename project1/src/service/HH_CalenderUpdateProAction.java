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
		String json = "/data1.json";
		String realPath = request.getServletContext().getRealPath(json);//json 파일의 real Path 를 추출

		
		try {
			Event event = new Event();	
			EventDao ed = EventDao.getInstance();
			//json 파일 생성
			JSONArray jsonArray = ed.getOnesoJSON(realPath);
			// 모임의 경우 sysdate 기준으로 값들을 삭제
			int result = ed.delpast();
			
	


		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hh_calenderUpdate.jsp";
	}

}
