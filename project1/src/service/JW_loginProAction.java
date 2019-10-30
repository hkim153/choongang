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
			
			HttpSession session = request.getSession(); // 세션 선언
			request.setCharacterEncoding("utf-8");
			jw_MemberDto member = new jw_MemberDto();
			jw_MemberDao md = jw_MemberDao.getInstance();
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");		
//			member.setId(request.getParameter("id"));
//			member.setPasswd(request.getParameter("passwd"));
			
			int result = md.check(id, passwd);
			
			if(result == 1) {
				System.out.println("로그인 성공!");
				session.setAttribute("result", result);		
				session.setAttribute("id", id);		
				session.setAttribute("passwd", passwd);		
				
			} else {
				System.out.println("로그인 실패...");
				session.setAttribute("result", 0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return "jw_loginPro.jsp";
	}

}
