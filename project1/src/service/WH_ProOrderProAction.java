package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Store; 
import dao.StoreDao;
import oracle.net.aso.e;

public class WH_ProOrderProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		StoreDao sd = StoreDao.getInstance();
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int pro_num = Integer.parseInt(request.getParameter("pro_num"));
		int pro_code = Integer.parseInt(request.getParameter("pro_code"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String pro_name = request.getParameter("pro_name");
		String seller = request.getParameter("seller");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String request_term = request.getParameter("request_term");
		int result = 0;
		int result2 = 0;
		
		System.out.println("1  ==> " + totalPrice);
		System.out.println("2  ==> " + pro_num );
		System.out.println("3  ==> " + pro_code);
		System.out.println("4  ==> " + quantity);
		System.out.println("5  ==> " + pro_name);
		System.out.println("6  ==> " + seller);
		System.out.println("7  ==> " + request_term);
		System.out.println("8  ==> " + name);
		System.out.println("9  ==> " + tel);
		System.out.println("10  ==> " + email);
		System.out.println("11  ==> " + address);
		
		Store store = new Store();
		store.setPrice(totalPrice);
		store.setPro_num(pro_num);
		store.setPro_code(pro_code);
		store.setQuantity(quantity);
		store.setPro_name(pro_name);
		store.setSeller(seller);
		store.setRequest_term(request_term);
		store.setName(name);
		store.setTel(tel);
		store.setEmail(email);
		store.setAddress(address);
		try {
			result = sd.order(store);
			result2 = sd.sellcnt(pro_num,quantity);
			request.setAttribute("result", result);
			request.setAttribute("pro_num", pro_num);
			request.setAttribute("pro_code", pro_code);
			System.out.println("result ==>" + result);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return "wh_proOrderPro.jsp";
	}

}
