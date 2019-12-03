package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Fishingsite;
import dao.FishingsiteDao;

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
			//작성자랑 로그인 아이디가 다를때 
			if(!id.equals(curid)) {
				result = -1;
			}
			else {
				//비밀번호가 틀렸을때
				if(!passwd.equals(rightpasswd)) {
					result = -2;
				}
				else {
					//아이디도 같고 비번도 같으면 먼저
					//fishmapping에 연결되어 있는 서식 어종들 삭제하고
					//낚시터 정보 삭제
					FishingsiteDao fsd = FishingsiteDao.getInstance();
					fsd.deletefishmapping(num);
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
