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
			board.setB_id(request.getParameter("b_id"));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
	      	String type = request.getParameter("b_head");
			if(type.equals("공지")) {
				board.setB_notice(1);
				board.setB_head(1);
			}
			else if(type.equals("자유")) {
				board.setB_notice(0);
				board.setB_head(2);
			}
			else if(type.equals("팁")) {
				board.setB_notice(0);
				board.setB_head(3);
			}
	        BoardDao bd = BoardDao.getInstance();//DB 
	        int result = bd.insert(board);
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "sh_boardWritePro.jsp";
	}

}
