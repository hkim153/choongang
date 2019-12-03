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

public class WH_ProStorePartAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		StoreDao sd = StoreDao.getInstance();
		MemberDao md = MemberDao.getInstance();
		int adminResult = 0;
		String s_code = (String)request.getParameter("s_code");
		System.out.println("s_code : " + s_code);
		String m_code = (String)request.getParameter("m_code");
		System.out.println("m_code : " + m_code);
		String b_code = (String)request.getParameter("b_code");
		System.out.println("b_code : " + b_code);
		String code = null;
		List<Store> pro_list;
		
		if(s_code.equals("00")){
			System.out.println("s_code 00 : " + s_code);
		} else {
			System.out.println("s_code !00 : " + s_code);
			
		}
		if(m_code.equals("00")){
			System.out.println("m_code 00 : " + m_code);
		} else {
			System.out.println("m_code !00 : " + m_code);
			
		}
		
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		try {
			if(s_code.equals("00")) {
				if(!m_code.equals("00")) {
					code= b_code+m_code;
					System.out.println("2. code값은 ? :"+code);
					pro_list = sd.pro_list(code, 3);
					request.setAttribute("pro_list", pro_list);
				} else if (m_code.equals("00")) {
				code = b_code;
				System.out.println("1. code값은 ? :"+code);
				pro_list = sd.pro_list(code, 1);
				request.setAttribute("pro_list", pro_list);
				}
				
			} else if(!s_code.equals("00")) {
				code = b_code + m_code + s_code;
				System.out.println("3. code값은 ? :"+code);
				pro_list = sd.pro_list(code, 5);
				request.setAttribute("pro_list", pro_list);
				
			}
			adminResult = md.confirm_Admin(id);
			
			request.setAttribute("adminResult", adminResult);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} 	
		return "wh_storepart.jsp";
	}

}
