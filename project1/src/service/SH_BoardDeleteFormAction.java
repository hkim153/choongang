package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class SH_BoardDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			String pageNum = request.getParameter("pageNum");
			
			BoardDao bd = BoardDao.getInstance();
			bd.cdeleteall(b_num);  // 댓글도 같이 삭제해준다 dao에서 가져옴
			int result = bd.delete(b_num);  //글 삭제
			
			
			request.setAttribute("result", result);
			request.setAttribute("b_num", b_num);
			request.setAttribute("pageNum", pageNum);
			
		
		}catch(Exception e) {	System.out.println(e.getMessage());	}
	/*	return "sh_board.jsp";*/
		
		return new SH_BoardAction().requestPro(request, response);
	}

}
