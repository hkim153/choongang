package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.jw_MemberDao;
import dao.jw_MemberDto;

public class JW_JoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
			jw_MemberDto member = new jw_MemberDto();
			member.setId(request.getParameter("id"));
			member.setPasswd(request.getParameter("passwd"));
			member.setName(request.getParameter("name"));
			member.setEmail(request.getParameter("email"));
			member.setAddress(request.getParameter("address"));
			member.setTel(request.getParameter("tel"));			
			
			jw_MemberDao md = jw_MemberDao.getInstance();
			int result = md.insert(member);
			request.setAttribute("result", result);
			System.out.println("result: "+result);
		
		} catch (Exception e) { System.out.println(e.getMessage());
			 
		}
		return "jw_joinPro.jsp";
		
		}
}
