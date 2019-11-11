package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.jw_MemberDao;
import dao.MemberDto;

public class JW_ConfirmIdProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 try {
			 request.setCharacterEncoding("utf-8");
			 String id = request.getParameter("id");
			 MemberDto member = new MemberDto();
			 member.setId(request.getParameter("id"));
//			 System.out.println("member: "+member);			 
//			 System.out.println("id: "+id);
			 
			 jw_MemberDao md = jw_MemberDao.getInstance();
//			 int result = md.insert(member);
			 int result = md.confirm(id);
//			 System.out.println("result: "+result);
			 request.setAttribute("result", result);
			 request.setAttribute("id", id);
			 
		 }catch (Exception e) { System.out.println(e.getMessage());
			// TODO: handle exception
		}
		return "jw_confirmIdPro.jsp";
		
	}

}
