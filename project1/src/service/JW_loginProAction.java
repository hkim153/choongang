package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.jw_MemberDao;
import dao.jw_MemberDto;

public class JW_loginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			jw_MemberDto member = new jw_MemberDto();
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
//			member.setId(request.getParameter("id"));
//			member.setPasswd(request.getParameter("passwd"));

			jw_MemberDao md = jw_MemberDao.getInstance();
			int result = md.check(id, passwd);
			
			request.setAttribute("result", result);
			if(result == 1) {
				HttpSession session = request.getSession();
				session.getAttribute("result");		
				System.out.println("세션: "+session);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return "jw_loginPro.jsp";
	}

}
