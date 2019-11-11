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
import dao.fish;
import dao.MemberDao;
import dao.Member;
public class SJ_RegFormAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			System.out.println("sj_regformaction");	
			HttpSession session = request.getSession();	
			request.setCharacterEncoding("utf-8");
			int num=0;		
			Member member = new Member();
			MemberDao md = MemberDao.getInstance();
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			Rank rank = new Rank();
			rank.setNum(num);
			RankDao rk = RankDao.getInstance();
			List<fish> list4 = rk.list4();
			request.setAttribute("list4", list4);	
			System.out.println("list4->"+list4);	
			if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			//System.out.println("regformaction result->"+result);
			int result1 = rk.insert(rank);
	}
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		

		return "sj_regForm.jsp";
	}

}
