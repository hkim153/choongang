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
import javax.servlet.http.HttpSession;

import dao.RankDao;
import dao.RankDto;
import dao.jw_MemberDao;
import dao.MemberDto;
public class SJ_RegFormAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			System.out.println("sj_regformaction");	
			HttpSession session = request.getSession();	
			request.setCharacterEncoding("utf-8");
			int num=0;		
			MemberDto member = new MemberDto();
			jw_MemberDao md = jw_MemberDao.getInstance();
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			RankDto rank = new RankDto();
			rank.setNum(num);
			//int result = md.check(id, passwd);
			//System.out.println("regformaction result->"+result);
			if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			RankDao rk = RankDao.getInstance();
			//System.out.println("regformaction result->"+result);
			int result1 = rk.insert(rank);
			/*if(result == 1) {
				System.out.println("아이디 일치!");
				session.setAttribute("result", result);		
				session.setAttribute("id", id);		
				session.setAttribute("passwd", passwd);		
				
			} else {
				System.out.println("아이디 다름...1");
				session.setAttribute("result", 0);
			}*/
			}
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			//session.setAttribute("id", id);
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		

		return "sj_regForm.jsp";
	}

}
