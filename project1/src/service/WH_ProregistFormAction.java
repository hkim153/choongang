package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StoreDao;
import dao.Store;

public class WH_ProregistFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		String b_code = "00";
		try {
			List<Store> b_menu = sd.b_menu();
			request.setAttribute("b_menu", b_menu);
			request.setAttribute("b_code", b_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "wh_proregistForm.jsp";
	}

} 
