package service;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.ServletRequest;
import java.util.Enumeration;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RankDao;
import dao.Rank;
import dao.Fish;
public class SJ_RegFormAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			//등록시 아이디 한번 더 안쓰게 하기위해서 디폴트 값으로 넣기위해
			String id = request.getParameter("id");
			
			RankDao rk = RankDao.getInstance();
			//fish테이블 어종 불러오기
			List<Fish> list3 = rk.list3();
			request.setAttribute("list3", list3);	
			request.setAttribute("id", id);
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		

		return "sj_regForm.jsp";
	}

}