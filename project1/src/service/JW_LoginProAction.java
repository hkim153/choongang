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
/// DB값이랑 비교해서 어드민권한 및 로그인 여부 확인
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
//			String admin_c = request.getParameter("admin_c");
//			String alive_c = request.getParameter("alive_c");
//			
//			System.out.println("어드민 컨디션: "+admin_c);

			int result = md.check(id, passwd); // id,passwd 일치여부 확인
			int adminResult = md.confirm_Admin(id); // 어드민인지 확인
			int aliveResult = md.confirm_Alive(id);
			

//			if(aliveResult == 1) { 	
				
			if (result == 1 && aliveResult == 1) {
				System.out.println("로그인 성공!");
				session.setAttribute("result", result);
				session.setAttribute("id", id);				
				session.setAttribute("passwd", passwd);
				session.setAttribute("adminResult", adminResult);
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