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
import dao.Rank;

public class SJ_RegProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");			
			//파일 최대 크기 설정
			int maxSize = 10 * 1024 * 1024;
			
			String img_folder = "/fish_rank";
			//이미지 띄우기 위해서 real path 가져오기
			String realPath = request.getServletContext().getRealPath(img_folder);
			//객체를 생성하면서 동시에 파일을 업로드
			MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			//업로드된 파일의 이름을 반환하기 위해
			Enumeration en = multi.getFileNames();
			//input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
			String filename1 = (String)en.nextElement();
			
			String id = multi.getParameter("id");
			
			String get_fish = multi.getParameter("get_fish");
			
			int length = Integer.parseInt(multi.getParameter("length"));
			
			String content = multi.getParameter("content");
			//서버에 저장된 파일 이름 
			String filename = multi.getFilesystemName(filename1);		//저장된 파일이름
			//전송전 원래의 파일 이름
			String original = multi.getOriginalFileName(filename1);   //실제파일이름
			//전송된 파일의 내용 타입
			String type = multi.getContentType(filename1);            //파일타입
			//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성 
			File file = multi.getFile(filename1);
			
			Rank rank = new Rank();
			rank.setId(id);
			rank.setGet_fish(get_fish);
			rank.setLength(length);
			rank.setContent(content);
			rank.setImg_folder(img_folder);
			rank.setFile_name(filename);
			rank.setReal_name(original);
			
			RankDao rk = RankDao.getInstance();
			//등록 result값이 1이면 insert성공 0이면 insert 실패
			int result = rk.insert(rank);
	
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
