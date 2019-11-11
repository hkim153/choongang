package service;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.jw_MemberDao;
import dao.jw_MemberDto;

public class ws_ModifyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int Num = Integer.parseInt(request.getParameter("Num"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			jw_MemberDao md = jw_MemberDao.getInstance();
			jw_MemberDto member = md.select(name);

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