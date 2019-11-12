package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class SH_BoardWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) pageNum = "1";
			request.setAttribute("pageNum", pageNum);
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "sh_boardWriteForm.jsp";
	}

}
