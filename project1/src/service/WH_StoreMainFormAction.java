package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Store;
import dao.StoreDao;

public class WH_StoreMainFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		StoreDao sd = StoreDao.getInstance();
		MemberDao md = MemberDao.getInstance();
		int adminResult = 0;
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		try {
			List<Store> pop_list = sd.pop_list();
			adminResult = md.confirm_Admin(id);
			request.setAttribute("pop_list", pop_list);
			request.setAttribute("adminResult", adminResult);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} 	
		
		return "wh_storemain.jsp";
	} 

}
