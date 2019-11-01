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
			String admin_c = request.getParameter("admin_c");
			// member.setId(request.getParameter("id"));
			// member.setPasswd(request.getParameter("passwd"));

			int result = md.check(id, passwd);
			int adminResult = md.confirm_A(admin_c); // 어드민인지 확인
			
//			System.out.println("결과 체크: " + result);
			System.out.println("어드민 체크: " + adminResult);
			
			String adminPage = "";
			if (result == 1) {
				System.out.println("로그인 성공!");
				session.setAttribute("result", result);
				session.setAttribute("id", id);
				session.setAttribute("passwd", passwd);
//				session.setAttribute("admin_c", admin_c);
//				System.out.println("adminResult100: "+admin_c);
//				if (adminResult == 1) {
////					System.out.println("adminResult: "+adminResult);
//					adminPage = "main.jsp";
////					session.setAttribute("admin_c", admin_c);
//				} else {
//					adminPage = "list.jsp";
//				}

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
