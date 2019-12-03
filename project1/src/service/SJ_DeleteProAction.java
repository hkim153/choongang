package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDao;
import dao.Rank;

public class SJ_DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			//순위 게시글 번호(보일 필요 없어 hidden 처리)
			int num = Integer.parseInt(request.getParameter("num"));
			RankDao rk = RankDao.getInstance();
			// 삭제에 성공하면 result값이 1 실패하면 0
			int result = rk.delete(num);
			request.setAttribute("result", result);
			request.setAttribute("num", num);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		
		return "sj_deletePro.jsp";
	}

}
