package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class JW_OutFormAction implements CommandProcess {
// 회원탈퇴 폼
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		 
		return "jw_outForm.jsp";
	}

}
