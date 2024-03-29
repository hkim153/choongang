package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDao;
import dao.Board;
import dao.BoardDao;
import dao.Rank;
import dao.Store;
import dao.StoreDao;

public class JW_MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		try {			
			
			request.setCharacterEncoding("utf-8");			
			List<Store> pop_list = sd.pop_list();
			Store store = new Store();
			RankDao rk = RankDao.getInstance();
			int startRow = 1, endRow = 999999999;
			//1부터99999999까지 리스트 보여주기
			List<Rank> list1 = rk.list1(startRow, endRow);	
			int startNum = startRow;
			int startRow1 = 1, endRow1 = 99999999;
			//startNum1 1로 선언
			int startNum1 = startRow1;
			//1부터99999999까지 리스트 보여주기
			List<Rank> list2 = rk.list2(startRow1, endRow1);
			
			BoardDao bd = BoardDao.getInstance();			
			List<Board> mainlist = bd.mainlist(0);		
			
			request.setAttribute("mainlist", mainlist);
			request.setAttribute("pop_list", pop_list);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("startNum", startNum);
			request.setAttribute("startNum1", startNum1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		// TODO Auto-generated method stub
		return "main.jsp";
	}
	

}
