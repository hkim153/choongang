package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Comment;

public class SH_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			String pageNum = request.getParameter("pageNum");
			int status = Integer.parseInt(request.getParameter("status"));
			System.out.println("status->" + status);
			BoardDao bd = BoardDao.getInstance();
			if(status==0) {
				bd.readcount(b_num); 	
			}
			Board board = bd.select(b_num);
			
			if(status == 1) {
				Comment temp = new Comment();
				String reply_content = request.getParameter("reply_content");
				String rel = request.getParameter("rel");
				System.out.println("board num ->" + board.getB_num());
				System.out.println("reply_content->" +reply_content);
				System.out.println("board_id->" + board.getB_id());
				temp.setComment_board(board.getB_num());
				temp.setComment_content(reply_content);
				temp.setComment_id(rel);  //여기서는 회원가입 한 사람 아이디 가져와야함
				
				bd.insertreply(temp);
			}
			//모든 댓글들을 보여줌.
			List<Comment> reply = bd.getallreply(b_num);
		
			
			request.setAttribute("reply", reply);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "sh_content.jsp";
	}

}
