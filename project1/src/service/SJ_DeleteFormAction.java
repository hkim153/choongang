package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Rank;
import dao.RankDao;

public class SJ_DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		
			//순위 게시글 번호(보일 필요 없어 hidden 처리)
			int num = Integer.parseInt(request.getParameter("num"));
			RankDao rk = RankDao.getInstance();
			// 회원 등록내역을 삭제하기위해서 num값 일치하면 삭제하기
			Rank rank = rk.select(num);
			request.setAttribute("rank", rank);
			request.setAttribute("num", num);
			}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "sj_deleteForm.jsp";
	}

}
