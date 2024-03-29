package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class WS_pwfindPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { System.out.println("pwfindProStart");
		request.setCharacterEncoding("utf-8"); 
		Member member = new Member();
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setEmail(request.getParameter("email"));
        member.setTel(request.getParameter("tel"));
        
        System.out.println(member.getId());
        System.out.println(member.getPasswd());
        System.out.println(member.getEmail());
        System.out.println(member.getTel());
        
        MemberDao md = MemberDao.getInstance();
        String y_pw = md.Findpw1(id, email, tel);
        int result = md.Findpw2(id, email, tel);
        if(result == 1) {
        	
        request.setAttribute("result", result);
		request.setAttribute("y_pw", y_pw);
		}  else {
			request.setAttribute("result", 0);
			System.out.println("잘못된정보입니다!");
		}
		System.out.println("result"+result);
		System.out.println("pwfindProAction : "+ y_pw);
	} catch(Exception e) { System.out.println(e.getMessage());			
		}
		
		return "ws_pwfindPro.jsp";
	}

}
