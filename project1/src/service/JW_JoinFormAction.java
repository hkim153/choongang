package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class JW_JoinFormAction implements CommandProcess {
// 회원가입
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		try {
//			String id = request.getParameter("id");
//			MemberDao md = MemberDao.getInstance();
//			Member member = md.select(id);
//			
//			request.setAttribute("id", id);
//			System.out.println("회원가입id "+id);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return "jw_joinForm.jsp";
	}
}
