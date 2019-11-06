package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RankDto;
import dao.jw_MemberDao;
import dao.jw_MemberDto;
import dao.RankDao;

public class SJ_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("utf-8");
			// jw_MemberDto member = new jw_MemberDto();
			// jw_MemberDao md = jw_MemberDao.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			// int result = md.check(id, passwd);
			// System.out.println("contentaction result->"+result);
			String real_name = request.getParameter("real_name");
			String img_folder = request.getParameter("img_folder");
			// System.out.println("id->"+id);
			// System.out.println("real_name->"+real_name);
			// System.out.println("img_folder->"+img_folder);
			RankDao rk = RankDao.getInstance();
			String realPath = request.getServletContext().getRealPath(img_folder);
			// System.out.println("realPath->"+realPath);
			RankDto rank = rk.select(id);
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			// System.out.println("contentaction id->"+id);
			// request.setAttribute("result", result);
			// session.setAttribute("id", id);
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
