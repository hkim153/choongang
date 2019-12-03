package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class JW_JoinProAction implements CommandProcess {
// 회원가입 DB에 값넣기 
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao md = MemberDao.getInstance();
		try {
			request.setCharacterEncoding("utf-8");
		
			Member member = new Member();
			
			member.setId(request.getParameter("id"));
			member.setPasswd(request.getParameter("passwd"));
			member.setName(request.getParameter("name"));
			member.setEmail(request.getParameter("email"));
			member.setAddress(request.getParameter("address"));
			member.setTel(request.getParameter("tel"));		
			member.setAdmin_c("N");			
			member.setAlive_c("A");			
			
			int result = md.insert(member); // sql문이 정상적으로 읽혀 db에 값을 입력했다면 result =1;			
			
			request.setAttribute("result", result); 
			System.out.println("result: "+result);
		
		} catch (Exception e) { System.out.println(e.getMessage());
			 
		}
		return "jw_joinPro.jsp";
		
		}
}
