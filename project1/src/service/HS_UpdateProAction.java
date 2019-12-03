package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Fishingsite;
import dao.FishingsiteDao;

public class HS_UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
			
			int maxSize = 10 * 1024 * 1024;
			String imagefile = "/fishingsite_img";
			String realPath = request.getServletContext().getRealPath(imagefile);
			System.out.println("realpath->" +  realPath);
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			
			String id = multi.getParameter("id");
			String curid = multi.getParameter("curid");
			String rightpasswd = multi.getParameter("rightpasswd");
			String passwd = multi.getParameter("passwd");
			String pageNum = multi.getParameter("pageNum");
			String [] fishes = multi.getParameterValues("어종");
			int num = Integer.parseInt(multi.getParameter("num"));
			int result;
			//작성자랑 현재 로그인된 아이디가 다를때
			if(!id.equals(curid)) {
				result = -1;
			}
			else {
				//입력한 비번이랑 현재 로그인된 비번이 다를때
				if(!passwd.equals(rightpasswd)) {
					result = -2;
				}
				else {
					Fishingsite fs = new Fishingsite();
					fs.setFs_num(num);
					fs.setFs_reg(multi.getParameter("fs_reg"));
					fs.setFs_addr(multi.getParameter("fs_addr"));
					fs.setFs_content(multi.getParameter("fs_content"));
					fs.setFs_phone(multi.getParameter("fs_phone"));
					String fs_name = multi.getParameter("fs_name");
					fs.setFs_name(fs_name);
					
					fs.setFs_content(multi.getParameter("fs_content"));
					fs.setFs_reg(multi.getParameter("fs_reg"));
					fs.setId(multi.getParameter("id"));
					
					
					Enumeration en = multi.getFileNames();
					String filename1 = (String)en.nextElement();
					String filename = multi.getFilesystemName(filename1);
					String original = multi.getOriginalFileName(filename1);
					
					
					FishingsiteDao fsd = FishingsiteDao.getInstance();
					//만약에 수정할 이미지를 첨부하지 않았다면 이미 저장된 이미지 사용
					if(filename == null) {
						System.out.println("파일 없음!!!!!!!");
						Fishingsite temp = fsd.select(num);
						fs.setImg_folder(temp.getImg_folder());
						fs.setReal_name(temp.getReal_name());
						fs.setSaved_name(temp.getSaved_name());
					}
					//수정할 이미지를 첨부했다면 파일이름과 폴더이름 다시 set하기!
					else {
						System.out.println("파일 잇음!!!~~~~~~");
					
						File file = multi.getFile(filename1);
						if(file != null){
							 System.out.println("imgFile 크기 : "+file.length());
						 }
						fs.setImg_folder(imagefile);
						fs.setReal_name(original);
						fs.setSaved_name(filename);
					}
					
					//1. 현재 낚시터에 서식하고 있는 맵핑 정보 다 delete하고
					//2. 낚시터 정보 update하구
					//3. 낚시터의 서식어종 다시 입력해준다
					fsd.deletefishmapping(num);
					result = fsd.update(fs);
					fsd.mappingfish(fishes, fs_name);
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
