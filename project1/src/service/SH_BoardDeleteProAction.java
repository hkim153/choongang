package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

public class SH_BoardDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int f_board_no = Integer.parseInt(request.getParameter("f_board_no"));
			String f_board_pass = request.getParameter("f_board_pass");
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			int result = bd.delete(f_board_no, f_board_pass);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("f_board_no", f_board_no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "sh_boardDeletePro.jsp";
	}

}
