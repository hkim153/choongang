package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.jw_MemberDao;
import dao.jw_MemberDto;

public class JW_JoinFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			jw_MemberDao md = jw_MemberDao.getInstance();
			jw_MemberDto member = md.select(id);
			request.setAttribute("id", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "jw_joinForm.jsp";
	}
}
