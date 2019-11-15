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
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		
		try {
			List<Store> sell_list = sd.sell_list(id);
			request.setAttribute("selllist", sell_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "wh_sellList.jsp";
	}

}
