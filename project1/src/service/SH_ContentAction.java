package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.CommentDTO;

public class SH_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			int f_board_no = Integer.parseInt(request.getParameter("f_board_no"));
			System.out.println("num->"+  f_board_no);
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			int status = Integer.parseInt(request.getParameter("status"));
			if(status==0) {
				bd.readCount(f_board_no); 	
			}
			Board board = bd.select(f_board_no);
			if(status == 1) {
				CommentDTO temp = new CommentDTO();
				String reply_content = request.getParameter("reply_content");
				System.out.println("board num ->" + board.getF_board_no());
				System.out.println("reply_content->" +reply_content);
				System.out.println("board_id->" + board.getF_board_id());
				temp.setComment_board(board.getF_board_no());
				temp.setComment_content(request.getParameter("reply_content"));
				temp.setComment_id(board.getF_board_id());  //여기서는 회원가입 한 사람 아이디 가져와야함
				bd.insertreply(temp);
			}
			//추가////////////////////////
			List<CommentDTO> reply = bd.getallreply(f_board_no);
			///////////////
		
			request.setAttribute("reply", reply);
			request.setAttribute("f_board_no", f_board_no);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "sh_content.jsp";
	}

}
