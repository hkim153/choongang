package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class SH_BoardUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        int b_num=Integer.parseInt(request.getParameter("b_num"));
	        Board board = new Board();
	        
	        board.setB_num(b_num);
	        board.setB_title(request.getParameter("b_title"));
	        board.setB_content(request.getParameter("b_content"));
	       
			BoardDao bd = BoardDao.getInstance();
			int result = bd.update(board);
			request.setAttribute("result", result);
			request.setAttribute("num", b_num);
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "sh_boardUpdatePro.jsp";
	}

}
