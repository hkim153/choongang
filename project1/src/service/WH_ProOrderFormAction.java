package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import dao.Store;
import dao.StoreDao;

public class WH_ProOrderFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		MemberDao md = MemberDao.getInstance();
		request.setCharacterEncoding("utf-8");
		HttpSession session =  request.getSession(true);
		String id = (String)session.getAttribute("id");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int pro_num = Integer.parseInt(request.getParameter("pro_num"));
		int pro_code = Integer.parseInt(request.getParameter("pro_code"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		try {
			List<Store>	proContent_img = sd.proContent_img(pro_num, pro_code); // 코드 재활용 - 첫이미지 불러오는 용도
			Store proContent = sd.proContent(pro_num, pro_code);  // 코드 재활용  - 상품 정보 불러오는 용도
			String first_img = proContent_img.get(0).getImg_folder()+"/"+proContent_img.get(0).getReal_name(); // 첫번째 이미지
			
			Member member = md.user_info(id);
						System.out.println(member.getName());
			request.setAttribute("proContent", proContent);
			request.setAttribute("first_img", first_img);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("quantity", quantity);
			request.setAttribute("member", member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "wh_proOrderForm.jsp";
	}

}
