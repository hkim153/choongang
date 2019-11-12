package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class WS_ModifyProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			Member member = new Member();
			member.setId(request.getParameter("id"));
			member.setName(request.getParameter("name"));
			member.setEmail(request.getParameter("email"));
			member.setAddress(request.getParameter("address"));
			member.setTel(request.getParameter("tel"));		
		     
			System.out.println("ws_ModifyProAction id"+id);
			System.out.println("ws_ModifyProAction name"+request.getParameter("name"));
			System.out.println("ws_ModifyProAction email"+request.getParameter("email"));
			System.out.println("ws_ModifyProAction address"+request.getParameter("address"));
					
			
			MemberDao md = MemberDao.getInstance();
			int result = md.myPageModify(member);
			System.out.println("result"+result);
			request.setAttribute("result", result);

		
		} catch (Exception e) { System.out.println(e.getMessage());
			 
		}
		return "ws_myPageModifyPro.jsp";		
		}
}

