package service;

import java.io.IOException;
import java.util.Enumeration;
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

import dao.RankDao;
import dao.RankDto;
public class SJ_RegFormAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			System.out.println("sj_regformaction");			
			int num=0;		
			String id = request.getParameter("id");
			
			RankDto rank = new RankDto();
			rank.setNum(num);
			
			if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			RankDao rk = RankDao.getInstance();
			
			//RankDto rank= rk.insert(num); 
			int result = rk.insert(rank);
			
			}
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		

		return "sj_regForm.jsp";
	}

}
