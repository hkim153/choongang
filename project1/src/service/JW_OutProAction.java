package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class JW_OutProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		Member member = new Member();
		member.setPasswd(request.getParameter("passwd"));
		MemberDao md = MemberDao.getInstance();
		try {
		int result = md.memberOut(member);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		}
		catch (Exception e) {
			 System.out.println(e.getMessage());
		}
		
		return "jw_outPro.jsp";
	}

}
