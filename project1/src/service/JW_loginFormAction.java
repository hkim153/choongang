package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class JW_loginFormAction implements CommandProcess {
// 로그인창
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(id);
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
