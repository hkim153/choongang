package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Rank;
import dao.RankDao;
import dao.Fish;

public class SJ_ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("utf-8");
			//리스트 띄우기 위해 get_fish가 일치하는지 보기위해서
			String get_fish = request.getParameter("get_fish");
			System.out.println("ListAction get_fish->" + get_fish);
			
			RankDao rk = RankDao.getInstance();
			//fish테이블 어종 불러오기
			List<Fish> list3 = rk.list3();
			request.setAttribute("list3", list3);
			//1부터99999999 선언
			int startRow = 1, endRow = 999999999;
			//1부터99999999까지 보여주기
			List<Rank> list = rk.list(startRow, endRow, get_fish);
			//startNum 1로 선언
			int startNum = startRow;
						
			request.setAttribute("get_fish", get_fish);
			request.setAttribute("list", list);
			request.setAttribute("startNum", startNum);
			System.out.println("list->" + list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "sj_list.jsp";

	}

}
