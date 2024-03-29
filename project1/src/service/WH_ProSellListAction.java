package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Store;
import dao.StoreDao;

public class WH_ProSellListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); // 세션 선언
		StoreDao sd = StoreDao.getInstance();
				
		try {
			int totCnt = sd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1)*pageSize + 1;
			int endRow = startRow + pageSize - 1 ;
			int startNum = totCnt - startRow +1;
			String id = (String)session.getAttribute("id");
			request.setCharacterEncoding("utf-8");
			List<Store> sell_list = sd.sell_list(id,startRow, endRow);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize+1;
			int endPage = startPage + blockSize -1;
			if(endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("selllist", sell_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "wh_sellList.jsp";
	}

}
