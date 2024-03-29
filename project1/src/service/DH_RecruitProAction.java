package service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Chat;
import dao.ChatDao;
import dao.Event;
import dao.EventDao;
import dao.Recruit;
import dao.RecruitDao;
import dao.StoreDao;



public class DH_RecruitProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); // 세션 선언 
		request.setCharacterEncoding("utf-8");
		
		String recruit_title = request.getParameter("Recruit_title");
		String recruit_id = request.getParameter("Recruit_id");
		String recruit_passwd = request.getParameter("Recruit_passwd");
		String recruit_species= request.getParameter("Recruit_species");
		String recruit_goal= request.getParameter("Recruit_goal");
		String recruit_timeset= request.getParameter("Recruit_timeset");
		int recruit_member= Integer.parseInt(request.getParameter("Recruit_member"));
		String recruit_event= request.getParameter("Recruit_event");
		
		
		System.out.println("1 : " + recruit_title);
		System.out.println("2 : " + recruit_id);
		System.out.println("3 : " + recruit_passwd);
		System.out.println("4 : " + recruit_species);
		System.out.println("5 : " + recruit_goal);
		System.out.println("6 : " + recruit_timeset);
		System.out.println("7 : " + recruit_member);
		System.out.println("8 : " + recruit_event);
		
		Recruit recruit = new Recruit();
		recruit.setRecruit_title(recruit_title);
		recruit.setId(recruit_id);
		recruit.setRecruit_passwd(recruit_passwd);
		recruit.setRecruit_species(recruit_species);
		recruit.setRecruit_goal(recruit_goal);
		recruit.setRecruit_timeset(recruit_timeset);
		recruit.setRecruit_member(recruit_member);
		recruit.setRecruit_event(recruit_event);
		
		String newroom = "방 생성 완료";
		Chat chat = new Chat();
		chat.setRoom_manager(recruit_id);
		chat.setChatContent(newroom);
		RecruitDao rd = RecruitDao.getInstance();
		ChatDao cd = ChatDao.getInstance();
		
		
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		
		try {
			result = rd.insert(recruit);                //팀원 모집 글 등록
			result2 = cd.createchatroom(chat);          // 팀원모집 글 등록과 동시에 채팅방 생성
			result3 = cd.participantlist(chat);         // 방생성 과 동시에 방 별 인원 리스트 생성
			
				int result6 = rd.maxnum();
				System.out.println("result6 ->" + result6);
			
				Event event = new Event();
		        event.setTitle(recruit_title);
		        System.out.println("event.title->" +event.getTitle());
		        event.setE_type("모임");	
		        System.out.println("event.type->" +event.getE_type());
		        event.setTextColor("#ffffff");	
		        System.out.println("event.Color->" +event.getTextColor());
		        event.setBackgroundColor("#74c0fc");
		        System.out.println("event.BackgroundColor->" +event.getBackgroundColor());
		        String [] rea = recruit_event.split("");
		        String re = "";
	        	for (int i = 0; i < rea.length; i++) {
					re += rea[i];
				if (i==3||i==5) {
						re += "-";
					}
				}
	        	System.out.println(re);

		        SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
		        
		        Date time = new Date();
				
		        String time1 = format.format(time);
		        
		        event.setE_start(time1);

		        event.setE_end(re);
		        System.out.println("event.re" +event.getE_end());
		        event.setDescription("상세 사항 참조");
		        event.setAllDay("true");
		        event.setRsa("변동 가능");
		        
		        
		    	String realPath = request.getRequestURI();
				String [] repaarr = realPath.split("/");
				realPath = repaarr[1];
		        
		        String a= "/"+realPath+"/dh_recruit_content.do?recruit_num="+result6+"&room_manager="+recruit_id;
		        System.out.println("result6 - > " + result6);
				event.setUrl(a); 
				EventDao ed = EventDao.getInstance();//DB 
		        int result5 = ed.insert(event);
		 
		        System.out.println("Event DB"+event.getE_id()+"번 입력 성공");
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		request.setAttribute("result", result);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		
		return "dh_recruitPro.jsp";
	}

}
