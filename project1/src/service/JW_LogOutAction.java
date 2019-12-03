package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JW_LogOutAction implements CommandProcess {
// LogOut
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 HttpSession session = request.getSession(); // LoginProAction에서 Set한 Session값 가져오기(get)
		 session.invalidate(); // 세션무효화
		 
		return "jw_logOut.jsp";
	}

}
