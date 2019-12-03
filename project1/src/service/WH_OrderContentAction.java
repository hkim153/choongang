package service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Store;
import dao.StoreDao;

public class WH_OrderContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); // 세션 선언
		StoreDao sd = StoreDao.getInstance();
		String id = (String)session.getAttribute("id");
		int buy_num = Integer.parseInt(request.getParameter("buy_num"));
		try {
			Store order_content = sd.order_content(buy_num, id);
			Date from = order_content.getReg_date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
			String to = transFormat.format(from);

			String order_num = to + order_content.getPro_num()+order_content.getBuy_num();
			String first_img = order_content.getImg_folder()+"/"+order_content.getReal_name();
			request.setAttribute("ordercontent", order_content);
			request.setAttribute("first_img", first_img);
			request.setAttribute("ordernum", order_num);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "wh_orderContentForm.jsp";
	}

}
