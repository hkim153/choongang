package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import dao.Rank;
import dao.RankDao;
import dao.fish;

public class SJ_ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("utf-8");
			String get_fish = request.getParameter("get_fish");
			System.out.println("ListAction get_fish->" + get_fish);
			
			RankDao rk = RankDao.getInstance();
			List<fish> list3 = rk.list3();
			request.setAttribute("list3", list3);
			
			int startRow = 1, endRow = 999999999;
			List<Rank> list = rk.list(startRow, endRow, get_fish);
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
