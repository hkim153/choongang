package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.fishingsite;
import dao.fishingsiteDao;

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
					fs.setFs_reg(multi.getParameter("fs_reg"));
					fs.setFs_addr(multi.getParameter("fs_addr"));
					fs.setFs_content(multi.getParameter("fs_content"));
					String fs_name = multi.getParameter("fs_name");
					fs.setFs_name(fs_name);
					
					fs.setFs_content(multi.getParameter("fs_content"));
					fs.setFs_reg(multi.getParameter("fs_reg"));
					fs.setId(multi.getParameter("id"));
					
					Enumeration en = multi.getFileNames();
					String filename1 = (String)en.nextElement();
					
					String filename = multi.getFilesystemName(filename1);
					String original = multi.getOriginalFileName(filename1);
					String type = multi.getContentType(filename1);
					File file = multi.getFile(filename1);
					if(file != null){
						 System.out.println("imgFile 크기 : "+file.length());
					 }
					fs.setImg_folder(imagefile);
					fs.setReal_name(original);
					fs.setSaved_name(filename);
					
					fishingsiteDao fsd = fishingsiteDao.getInstance();
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
