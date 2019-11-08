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
			int f_board_no = 0;
			String pageNum = request.getParameter("pageNum");
			
			
			if (pageNum == null) pageNum = "1";
			if (request.getParameter("f_board_no") != null) {
				f_board_no = Integer.parseInt(request.getParameter("f_board_no"));
				BoardDao bd = BoardDao.getInstance();
				Board board = bd.select(f_board_no);
				
			}
			request.setAttribute("f_board_no", f_board_no);

			request.setAttribute("pageNum", pageNum);
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "sh_boardWriteForm.jsp";
	}

}
