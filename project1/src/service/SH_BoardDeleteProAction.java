package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class SH_BoardDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			String pageNum = request.getParameter("pageNum");
			String passwd = request.getParameter("passwd");
			String rightpasswd = request.getParameter("rightpasswd");
			String curid = request.getParameter("curid");
			int result = 0;
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(b_num);
			if(curid.equals(board.getB_id())) {
				if(passwd.equals(rightpasswd)) {
					
					//todo 
					bd.cdeleteall(b_num);
					result = bd.delete(b_num);
				}
				else {
					result = -2;
				}
			}
			else {
				result = -1;
			}
			
			request.setAttribute("result", result);
			request.setAttribute("b_num", b_num);
			request.setAttribute("pageNum", pageNum);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "sh_boardDeletePro.jsp";
	}

}
