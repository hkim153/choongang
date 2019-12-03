package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Member;

public class WS_ModifyProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
			String id = (String) session.getAttribute("id");

			Member member = new Member();
			member.setId(request.getParameter("id"));
			member.setName(request.getParameter("name"));
			member.setEmail(request.getParameter("email"));
			member.setAddress(request.getParameter("address"));
			member.setTel(request.getParameter("tel"));

			MemberDao md = MemberDao.getInstance();
			int result = md.myPageModify(member);
			int aliveResult = md.confirm_Alive(id);
			if (aliveResult == 1 && result == 1) {
				request.setAttribute("result", result);
				request.setAttribute("id", id);
			} else {
				request.setAttribute("result", 0);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
		return "ws_myPageModifyPro.jsp";
	}
}
