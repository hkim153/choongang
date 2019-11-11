package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.jw_MemberDao;
import dao.MemberDto;

public class ws_idfindPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { System.out.println("idfindProStart");
		request.setCharacterEncoding("utf-8"); 
		MemberDto member = new MemberDto();
		
		member.setId(request.getParameter("id"));
		member.setEmail(request.getParameter("email"));
        member.setTel(request.getParameter("tel"));
        
        System.out.println(member.getId());
        System.out.println(member.getEmail());
        System.out.println(member.getTel());
        
        jw_MemberDao md = jw_MemberDao.getInstance();
        String y_id = md.Findid(member.getEmail(), member.getTel());
        int result = md.myPageModify(member);
		request.setAttribute("result", result);
		request.setAttribute("y_id", y_id);
		System.out.println("result"+result);
		System.out.println("IdfindProAction : "+ y_id);
	} catch(Exception e) { System.out.println(e.getMessage());		
		}
					
		return "ws_idfindPro.jsp";
	}

}
