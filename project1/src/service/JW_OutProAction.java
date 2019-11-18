package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		MemberDao md = MemberDao.getInstance();
		System.out.println("id->"+id);
		System.out.println("passwd->"+passwd);
		try {
			int result = md.memberOut(member); //memberOut 불러오기
			request.setAttribute("result", result);
			request.setAttribute("id", id);
			HttpSession session = request.getSession();
			 session.invalidate();
			System.out.println("result->"+result);
		}
		catch (Exception e) {
			 System.out.println(e.getMessage());
		}	
		return "jw_outPro.jsp";
	}
}
