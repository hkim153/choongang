package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class SH_BoardWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
			
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        Board board = new Board();
			board.setF_board_no(Integer.parseInt(request.getParameter("f_board_no")));
			board.setF_board_id(request.getParameter("f_board_id"));
			board.setF_board_title(request.getParameter("f_board_title"));
			board.setF_board_content(request.getParameter("f_board_content"));
	        board.setF_board_pass(request.getParameter("f_board_pass"));
	        board.setF_board_readcount(Integer.parseInt("0"));
			board.setF_board_file_name(null);
			board.setGood(0);		
			
			
	        BoardDao bd = BoardDao.getInstance();//DB 
	        int result = bd.insert(board);
	        request.setAttribute("num", board.getF_board_no());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "sh_boardWritePro.jsp";
	}

}
