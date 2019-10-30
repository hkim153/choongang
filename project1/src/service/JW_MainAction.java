package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Store;
import dao.StoreDao;

public class JW_MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		try {
			
			request.setCharacterEncoding("utf-8");
			List<Store> list = sd.list(); 	// 메인에서 상품리스트 불러오는 코드 by.원희
			Store store = new Store();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
		// TODO Auto-generated method stub
		return "main.jsp";
	}

}
