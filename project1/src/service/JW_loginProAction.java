package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.MemberDao;
import dao.Member;

public class JW_loginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			HttpSession session = request.getSession(); // 세션 선언
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			MemberDao md = MemberDao.getInstance();
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String admin_c = request.getParameter("admin_c");
			
			System.out.println("어드민 캐릭터: "+admin_c);

			int result = md.check(id, passwd); // id,passwd
			int adminResult = md.confirm_A(admin_c, id); // 어드민인지 확인
			System.out.println("어드민 체크: " + adminResult);

			String adminPage = "";
			if (result == 1) {
				System.out.println("로그인 성공!");
				session.setAttribute("result", result);
				session.setAttribute("id", id);
				session.setAttribute("passwd", passwd);
				session.setAttribute("adminResult", adminResult);
				System.out.println("adminResult Check"+adminResult);

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
