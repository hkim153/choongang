package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

public class SH_CommentDeleteAction  implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			int comment_num = Integer.parseInt(request.getParameter("reply_num"));
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			String pageNum = request.getParameter("pageNum");

			BoardDao db = BoardDao.getInstance();
			
			int result = db.cdelete(comment_num); //댓글 삭제 게시글 번호와 댓글번호 가져와서 삭제
			
			request.setAttribute("b_num", b_num);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		/*return "sh_content.jsp";*/
		return new SH_ContentAction().requestPro(request, response);
 	}
}
