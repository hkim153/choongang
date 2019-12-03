package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Member;

public class WS_idfindPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
//		System.out.println("idfindProStart");
		request.setCharacterEncoding("utf-8"); 
		Member member = new Member();
		
		
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		member.setId(request.getParameter("id"));
		member.setEmail(request.getParameter("email"));
        member.setTel(request.getParameter("tel"));
        
//        System.out.println(member.getId());
//        System.out.println(member.getEmail());
//        System.out.println(member.getTel());
        
        MemberDao md = MemberDao.getInstance();
        String y_id = md.Findid1(email, tel);
        int result = md.Findid2(email, tel);
        
        System.out.println("result: "+ result);
        
        
        
        	if(result ==1) {
		request.setAttribute("result", result);
		request.setAttribute("y_id", y_id);
//		System.out.println("result"+result);
//		System.out.println("IdfindProAction : "+ y_id);}
        
        } else {
        	request.setAttribute("result", 0);
        	System.out.println("상태변경에 실패하였습니다.");
        }
	} catch(Exception e) { System.out.println(e.getMessage());		
		}
					
		return "ws_idfindPro.jsp";
	}

}
