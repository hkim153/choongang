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
			
//			int totCnt = md.getUser_num();
//			String user_num = request.getParameter("user_num");
//			if(user_num == null || user_num.equals("")) { user_num ="1";}
//			int user_num1 = Integer.parseInt(user_num);
			
			
			Member member = new Member();
			
			member.setId(request.getParameter("id"));
			member.setPasswd(request.getParameter("passwd"));
			member.setName(request.getParameter("name"));
			member.setEmail(request.getParameter("email"));
			member.setAddress(request.getParameter("address"));
			member.setTel(request.getParameter("tel"));		
			member.setAdmin_c("N");			
			member.setAlive_c("A");
//			member.setUser_num(user_num1);		
			
			int result = md.insert(member);
			
			request.setAttribute("result", result);
			System.out.println("result: "+result);
		
		} catch (Exception e) { System.out.println(e.getMessage());
			 
		}
		return "jw_joinPro.jsp";
		
		}
}
