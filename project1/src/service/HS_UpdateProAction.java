package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.fishingsite;
import dao.fishingsiteDao;

public class HS_UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
			
			String id = request.getParameter("id");
			String curid = request.getParameter("curid");
			String rightpasswd = request.getParameter("rightpasswd");
			String passwd = request.getParameter("passwd");
			String pageNum = request.getParameter("pageNum");
			int num = Integer.parseInt(request.getParameter("num"));
			int result;
			if(!id.equals(curid)) {
				result = -1;
			}
			else {
				if(!passwd.equals(rightpasswd)) {
					result = -2;
				}
				else {
					fishingsite fs = new fishingsite();
					fs.setFs_num(num);
					fs.setFs_reg(request.getParameter("fs_reg"));
					fs.setFs_addr(request.getParameter("fs_addr"));
					fs.setFs_content(request.getParameter("fs_content"));
					fs.setFs_img(request.getParameter("fs_img"));
					fs.setFs_name(request.getParameter("fs_name"));
					fishingsiteDao fsd = fishingsiteDao.getInstance();
					result = fsd.update(fs);
				}
			}
			request.setAttribute("result", result);
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "hs_updatePro.jsp";
	}

}
