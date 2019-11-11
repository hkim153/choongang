package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class JW_ConfirmIdProAction implements CommandProcess {
// 아이디 중복확인
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 try {
			 request.setCharacterEncoding("utf-8");
			 String id = request.getParameter("id");
			 Member member = new Member();
			 member.setId(request.getParameter("id"));
			 
			 MemberDao md = MemberDao.getInstance();
			 
			 int result = md.confirm(id);
			 request.setAttribute("result", result);
			 request.setAttribute("id", id);
			 
		 }catch (Exception e) { System.out.println(e.getMessage());
			// TODO: handle exception
		}
		return "jw_confirmIdPro.jsp";
		
	}

}
