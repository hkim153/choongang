package service;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Member;

public class WS_ModifyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao md = MemberDao.getInstance();
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
				
		try {
			Member member = md.select(id);
			
			String name = member.getName();
			String email = member.getEmail();
			String address = member.getAddress();
			String tel = member.getTel();
						
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("tel", tel);
			

		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		return "ws_myPageModifyForm.jsp";
	}

}
