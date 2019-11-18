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

public class JW_MyPageProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(); // 세션 선언
		// 마이페이지에서 구매현황 코드
		StoreDao sd = StoreDao.getInstance();
		MemberDao md = MemberDao.getInstance();
		String id = (String)session.getAttribute("id");
		
		
		request.setCharacterEncoding("utf-8");
		
		try {
			Member member = md.select(id);
			String name = member.getName();
			String email = member.getEmail();
			String tel = member.getTel();
			String address = member.getAddress();

			List<Store> order_state = sd.order_state(id);
			int cancel = order_state.get(3).getState_count();   // 취소한 상품 갯수
			int takeback =order_state.get(4).getState_count();  // 반품한 상품 갯수
			int exchange = order_state.get(5).getState_count(); // 교환한 상품 갯수
			int decide = order_state.get(6).getState();         // 구매확정 상태값
			int total = cancel + takeback + exchange;           // 3가지 합계

			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("tel", tel);
			request.setAttribute("address", address);
			
			request.setAttribute("decide", decide);
			request.setAttribute("total", total);
			request.setAttribute("orderstate", order_state);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 구매현황 종료
		return "jw_myPage.jsp";
	}

}
