package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.Member;
import dao.MemberDao;
import dao.Recruit;
import dao.RecruitDao;
import dao.Store;
import dao.StoreDao;

public class JW_MyPageProAction implements CommandProcess {
// MyPageMain View
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(); // 세션 선언
		// 마이페이지에서 구매현황 코드
		StoreDao sd = StoreDao.getInstance();
		MemberDao md = MemberDao.getInstance();
		String id = (String)session.getAttribute("id");
		String b_id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		
		try {
			Member member = md.select(id); // 아이디에 해당하는 정보 DB에서 호출
			// DB에서 불러온값 해당하는 String에 넣기 (View에 Attribute해줘야하기때문)
			String name = member.getName(); 
			String email = member.getEmail();
			String tel = member.getTel();
			String address = member.getAddress();

			List<Store> order_state = sd.order_state(id);
			int cancel = order_state.get(3).getState_count();   // 취소한 상품 갯수
			int takeback =order_state.get(4).getState_count();  // 반품한 상품 갯수
			int exchange = order_state.get(5).getState_count(); // 교환한 상품 갯수
			int decide = order_state.get(6).getState();         // 구매확정 상태값
			int total = cancel + takeback + exchange;     // 3가지 합계
			
			BoardDao bd = BoardDao.getInstance();
			List<Board> myList = bd.mylist(b_id);
			
			RecruitDao rd = RecruitDao.getInstance();
			List<Recruit> myRecruit = rd.myRecruit(id);
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("tel", tel);
			request.setAttribute("email", email);
			
			
			request.setAttribute("decide", decide);
			request.setAttribute("total", total);
			request.setAttribute("orderstate", order_state);
			
			request.setAttribute("myRecruit", myRecruit);
			
			request.setAttribute("myList", myList);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 구매현황 종료
		return "jw_myPage.jsp";
	}

}
