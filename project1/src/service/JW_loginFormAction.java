package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.jw_MemberDao;
import dao.jw_MemberDto;

public class JW_loginFormAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			jw_MemberDao md = jw_MemberDao.getInstance();
			jw_MemberDto member = md.select(id);
			// passwd = member.getPasswd();

			request.setAttribute("id", id);
			request.setAttribute("passwd", passwd);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		return "jw_loginForm.jsp";
	}

}
