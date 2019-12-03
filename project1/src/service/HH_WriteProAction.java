package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Event;
import dao.EventDao;
import dao.Fishingsite;
import dao.FishingsiteDao;

public class HH_WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("utf-8");
			// 제보 사항을 구별하기 위한 부분
			String chk = "0";
			if (request.getParameter("chk").equals("1")) {
				chk = request.getParameter("chk");
			}

			// url 기본 디폴트 세팅 - 네이버 검색창 이동
			String urldmy = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=";
			Event event = new Event();
			
			//프로젝트 관련 페이지(낚시터)와 구분 하기 위한 부분
			String[] arr = { "서울", "인천", "경기", "강원", "충청", "대전", "전라", "전라", "전라", "경상", "대구", "부산", "제주" , "기타" };
			int ck1 = 1;
			for (int i = 0; i < arr.length; i++) {
				if (arr[i].equals(request.getParameter("eventpin"))) {
					ck1 = 0;
					break;
				}
			}
			
			event.setE_type(request.getParameter("e_type"));
			String title = request.getParameter("title");
			
			// 관리자 페이지에서 올리지 않으면 title 뒤에  (제보) 라고 표시
			if (chk.equals("1")) {
				title += " (제보)";
			}
			
			event.setTitle(title);
			event.setTextColor(request.getParameter("textColor"));
			String etclr = request.getParameter("e_type");
			
			//이벤트의 성격에 따른 배경색 배정
			String clr = "";
			switch (etclr) {

			case "지역 행사":
				clr = "#ffa94d";//주황
				break;
			case "개인 행사":
				clr = "#9775fa";//보라
				break;
			case "대회":
				clr = "#63e6be";//연두
				break;
			case "모임":
				clr = "#74c0fc";//파랑
				break;
			case "금어기":
				clr = "#D25565";//빨강
				break;
			case "기타":
				clr = "#4d638c";//남
				break;

			}
			event.setBackgroundColor(clr);
			

			event.setE_start(request.getParameter("e_start"));
			event.setE_end(request.getParameter("e_end"));
			event.setDescription(request.getParameter("description"));
			event.setAllDay(request.getParameter("allday"));
			event.setRsa(request.getParameter("eventpin"));
			
			//url 세팅 - 기본 사항일 경우 네이버 배정, 낚시터 위치 행사일 경우 낚시터로 이동, url 값을 입력 했을 경우 url로 이동
			if (request.getParameter("url").equals("")) {
				if (ck1 == 0) {
					event.setUrl(urldmy + request.getParameter("title"));
				} else if (ck1 == 1) {
					FishingsiteDao fsd = FishingsiteDao.getInstance();
					Fishingsite c = fsd.select2(event.getRsa());
					int b = c.getFs_num();
					
					
					String realPath = request.getRequestURI();
					String [] repaarr = realPath.split("/");
					realPath = repaarr[1];
					
					String a = "/"+realPath+"/hs_content.do?num=" + b;
					event.setUrl(a);
				}
			} else {
				event.setUrl(request.getParameter("url"));
			}

			EventDao ed = EventDao.getInstance();// DB
			
			// 이벤트가 약 10일 이상 지속될 경우 시작/ 종료로 날자 값을 배분
			String a = request.getParameter("e_start");
			String[] arra = a.split("-");

			String b = request.getParameter("e_end");
			String[] arrb = b.split("-");

			int[] aa = new int[arra.length];
			int[] bb = new int[arrb.length];

			for (int i = 0; i < aa.length; i++) {
				aa[i] = Integer.parseInt(arra[i]);
				bb[i] = Integer.parseInt(arrb[i]);
			}
			if (aa[0] < bb[0]) {
				bb[1] += 12;
			}
			int sn = (aa[1] * 30) + aa[2];
			int en = (bb[1] * 30) + bb[2];
			int ck = 0;
			if (en - sn > 10) {
				ck = 1;
			}
			int result = 0;
			if (ck == 0) {
				result = ed.insert(event);
			} else {
				event.setE_end(request.getParameter("e_start"));
				String bytitle1 = request.getParameter("title") + " 시작";
				event.setTitle(bytitle1);
				result = ed.insert(event);

				event.setE_start(request.getParameter("e_end"));
				event.setE_end(request.getParameter("e_end"));
				String bytitle2 = request.getParameter("title") + " 종료";
				event.setTitle(bytitle2);

				result = ed.insert(event);
			}
			request.setAttribute("num", event.getE_id());
			request.setAttribute("result", result);
			request.setAttribute("chk", chk);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hh_writePro.jsp";
	}
}