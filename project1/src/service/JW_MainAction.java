package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDao;
import dao.RankDto;
import dao.Store;
import dao.StoreDao;

public class JW_MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		try {
			
			request.setCharacterEncoding("utf-8");
			List<Store> pop_list = sd.pop_list(); 	// ���ο��� ��ǰ����Ʈ �ҷ����� �ڵ� by.����
			Store store = new Store();
			RankDao rk = RankDao.getInstance();
			int startRow = 1, endRow = 99;
			List<RankDto> list1 = rk.list1(startRow, endRow);
			int startNum = startRow;

			request.setAttribute("pop_list", pop_list);
			request.setAttribute("list1", list1);
			request.setAttribute("startNum", startNum);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
		// TODO Auto-generated method stub
		return "main.jsp";
	}
	

}
