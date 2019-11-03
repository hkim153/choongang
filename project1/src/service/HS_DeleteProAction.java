package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String passwd = request.getParameter("passwd");
			String pageNum = request.getParameter("pageNum");
			String rightpasswd = request.getParameter("rightpasswd");
			String id = request.getParameter("id");
			String curid = request.getParameter("curid");
			
			int result;
			if(!id.equals(curid)) {
				result = -1;
			}
			else {
				if(!passwd.equals(rightpasswd)) {
					result = -2;
				}
				else {
					fishingsiteDao fsd = fishingsiteDao.getInstance();
					result = fsd.delete(num);
				}
			}
			
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("num", num);
		} catch (Exception e) { System.out.println(e.getMessage()); }
        return "hs_deletePro.jsp";
	}

}
