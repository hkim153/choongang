package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Rank;
import dao.MemberDao;
import dao.Member;
import dao.RankDao;

public class SJ_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("id");
			String real_name = request.getParameter("real_name");
			String img_folder = request.getParameter("img_folder");
			RankDao rk = RankDao.getInstance();
			String realPath = request.getServletContext().getRealPath(img_folder);
			Rank rank = rk.select(num);
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("rank", rank);
			request.setAttribute("real_name", real_name);
			request.setAttribute("img_folder", img_folder);
			System.out.println("realPath->" + realPath);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "sj_content.jsp";
	}

}
