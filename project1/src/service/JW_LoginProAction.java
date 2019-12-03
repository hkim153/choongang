package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.MemberDao;
import dao.Member;

public class JW_LoginProAction implements CommandProcess {
// 로그인확인(어드민,가입여부)
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			HttpSession session = request.getSession(); // 세션 선언
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			MemberDao md = MemberDao.getInstance();
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");

			int result = md.check(id, passwd); // id,passwd 일치여부 확인
			int adminResult = md.confirm_Admin(id); // 어드민인지 확인
			int aliveResult = md.confirm_Alive(id); // 가입중인 회원은 1 탈퇴한 회원은 0			
				
			if (result == 1 && aliveResult == 1) { // result = DB에 있는 회원이랑 일치 => 1, aliveResult =1(가입중인회원)
				System.out.println("로그인 성공!");
				session.setAttribute("result", result); 
				session.setAttribute("id", id);  
				session.setAttribute("passwd", passwd);
				session.setAttribute("adminResult", adminResult); // 어드민권한
				System.out.println("adminResult Check"+adminResult); 
				
			} else {
				System.out.println("로그인 실패...");
				session.setAttribute("result", 0);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
		return "jw_loginPro.jsp";
	}

}
