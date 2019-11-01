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

public class SJ_RegProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			request.setCharacterEncoding("utf-8");
			int num=1;
			int maxSize = 10 * 1024 * 1024;
			String img_folder = "/fish_rank";
			String realPath = request.getServletContext().getRealPath(img_folder);
			MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			Enumeration en = multi.getFileNames();
			String filename1 = (String)en.nextElement();
			String id = multi.getParameter("id");
			String get_fish = multi.getParameter("get_fish");
			int length = Integer.parseInt(multi.getParameter("length"));
			String content = multi.getParameter("content");
			String filename = multi.getFilesystemName(filename1);     //저장된 파일이름
			String original = multi.getOriginalFileName(filename1);   //실제파일이름
			String type = multi.getContentType(filename1);            //파일타입
			File file = multi.getFile(filename1);
			
			RankDto rank = new RankDto();
			rank.setNum(num);
			rank.setId(id);
			rank.setGet_fish(get_fish);
			rank.setLength(length);
			rank.setContent(content);
			rank.setImg_folder(img_folder);
			rank.setFile_name(filename);
			rank.setReal_name(original);
			
			RankDao rk = RankDao.getInstance();
			int result = rk.insert(rank);
	
			System.out.println("result111->"+result);
			
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("get_fish", get_fish );
			request.setAttribute("length", length);
			request.setAttribute("content", content);
			request.setAttribute("img_folder", img_folder );
			request.setAttribute("filename", filename);
			request.setAttribute("real_name", original);
			
			
			request.setAttribute("result", result);

		}catch(Exception e) { System.out.println(e.getMessage()); }
		
		return "sj_regPro.jsp";
	}

}
