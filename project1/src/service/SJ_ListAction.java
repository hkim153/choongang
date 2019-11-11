package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Rank;
import dao.RankDao;

public class SJ_ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("utf-8");
			String get_fish = request.getParameter("get_fish");
			System.out.println("ListAction get_fish->" + get_fish);
//			String real_name = request.getParameter("real_name");
//			String img_folder = request.getParameter("img_folder");
			RankDao rk = RankDao.getInstance();
			int startRow = 1, endRow = 99;
			List<Rank> list = rk.list(startRow, endRow, get_fish);
			int startNum = startRow;
//			int num = Integer.parseInt(request.getParameter("num"));

			//System.out.println("ListAction get_fish->" + get_fish);
			
			//RankDto rank = rk.get(get_fish);
			
			request.setAttribute("get_fish", get_fish);
			request.setAttribute("list", list);
			request.setAttribute("startNum", startNum);
//			request.setAttribute("num", num);
//			request.setAttribute("real_name", real_name);
//			request.setAttribute("img_folder", img_folder);
			//request.setAttribute("rank", rank);
			//System.out.println("ListAction get_fish->" + get_fish);
			System.out.println("list->" + list);
			//System.out.println("rank->" + rank);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "sj_list.jsp";

	}

}
