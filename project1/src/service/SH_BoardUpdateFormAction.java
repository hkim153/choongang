package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class SH_BoardUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(b_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		
			
		}catch(Exception e) {	
			System.out.println(e.getMessage());	
		}
		return "sh_boardUpdateForm.jsp";
	}
	}

