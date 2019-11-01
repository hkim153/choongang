package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Store;
import dao.StoreDao;

public class WH_StoreMainFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		request.setCharacterEncoding("utf-8");
		try {
			List<Store> pop_list = sd.pop_list();
			request.setAttribute("pop_list", pop_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} 	
		Store store = new Store();
		return "store_main.jsp";
	} 

}
