package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WH_Pro_registProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int maxSize = 10 * 1024 * 1024;
		String imagefile = "/imageupload";
		String realPath = request.getServletContext().getRealPath(imagefile);
		System.out.println("realPath ==>"+ realPath);

		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		System.out.println("---------        WriteProAction          --------");
		
		String b_code = multi.getParameter("b_code");                             //대분류
		String m_code = multi.getParameter("m_code");                             //중분류
		String s_code = multi.getParameter("s_code");				                //소분류
		System.out.println("상품코드 ==>"+ b_code + m_code + s_code);
		String pro_name = multi.getParameter("pro_name");                         //상품명
		int price = Integer.parseInt(multi.getParameter("price"));                //상품가격
		int stock = Integer.parseInt(multi.getParameter("stock"));                //재고수
		String origin = multi.getParameter("origin");                             //원산지
		String pro_made = multi.getParameter("pro_made");                         //제조사
		int pro_state = Integer.parseInt(multi.getParameter("pro_state"));  //상품판매상태
		String pro_contentFile = "";
		String pro_imgFile = "";
		String pro2_imgFile = "";
		String pro3_imgFile = "";
		String pro4_imgFile = "";
		String pro5_imgFile = "";
		//int maxSize = 10 * 1024 * 1024;
		
		System.out.println("realPath -> "+realPath);
		
		//MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration en = multi.getFileNames();
		System.out.println("en.hasMoreElements()==>"+en.hasMoreElements());
		while (en.hasMoreElements()){
			/*String filename1 = (String)en.nextElement();
			switch(filename1) {
			case "pro_contentFile" : pro_contentFile = (String)en.nextElement();
									 String filename = multi.getFilesystemName(pro_contentFile);
									 String original = multi.getOriginalFileName(pro_contentFile);
									 String type = multi.getContentType(pro_contentFile);
									 File file = multi.getFile(pro_contentFile);
				
									 System.out.println("파라메타 이름 : "+pro_contentFile);
									 System.out.println("실제파일이름 : "+original);
									 System.out.println("저장된 파일이름 : "+filename);
									 System.out.println("파일 타입 : "+ type);
									 if(file != null){
									 	System.out.println("pro_contentFile 크기 : "+file.length());
									 }
									 break;
			case "pro_imgFile":	     pro_imgFile = (String)en.nextElement();
									 String filename11 = multi.getFilesystemName(pro_imgFile);
									 String original1 = multi.getOriginalFileName(pro_imgFile);
									 String type1 = multi.getContentType(pro_imgFile);
									 File file1 = multi.getFile(pro_imgFile);
				
									 System.out.println("파라메타 이름 : "+pro_imgFile);
									 System.out.println("실제파일이름 : "+original1);
									 System.out.println("저장된 파일이름 : "+filename11);
									 System.out.println("파일 타입 : "+ type1);
									 if(file1 != null){
										 System.out.println("pro_imgFile 크기 : "+file1.length());
									 }
									 break;
			case "pro2_imgFile":     pro2_imgFile = (String)en.nextElement();
									 String filename2 = multi.getFilesystemName(pro2_imgFile);
									 String original2 = multi.getOriginalFileName(pro2_imgFile);
									 String type2 = multi.getContentType(pro2_imgFile);
									 File file2 = multi.getFile(pro2_imgFile);
				
									 System.out.println("파라메타 이름 : "+pro2_imgFile);
									 System.out.println("실제파일이름 : "+original2);
									 System.out.println("저장된 파일이름 : "+filename2);
									 System.out.println("파일 타입 : "+ type2);
									 if(file2 != null){
										 System.out.println("pro2_imgFile 크기 : "+file2.length());
									 }
									 break;
			case "pro3_imgFile" :    pro3_imgFile = (String)en.nextElement();
				                     String filename3 = multi.getFilesystemName(pro3_imgFile);
				                     String original3 = multi.getOriginalFileName(pro3_imgFile);
				                     String type3 = multi.getContentType(pro3_imgFile);
				                     File file3 = multi.getFile(pro3_imgFile);
				
				                     System.out.println("파라메타 이름 : "+pro3_imgFile);
				                     System.out.println("실제파일이름 : "+original3);
				                     System.out.println("저장된 파일이름 : "+filename3);
				                     System.out.println("파일 타입 : "+ type3);
									 if(file3 != null){
										 System.out.println("pro3_imgFile 크기 : "+file3.length());
									 }
									 break;
			case "pro4_imgFile" :    pro4_imgFile = (String)en.nextElement();
									 String filename4 = multi.getFilesystemName(pro4_imgFile);
									 String original4 = multi.getOriginalFileName(pro4_imgFile);
									 String type4 = multi.getContentType(pro4_imgFile);
									 File file4 = multi.getFile(pro4_imgFile);
				
									 System.out.println("파라메타 이름 : "+pro4_imgFile);
									 System.out.println("실제파일이름 : "+original4);
									 System.out.println("저장된 파일이름 : "+filename4);
									 System.out.println("파일 타입 : "+ type4);
									 if(file4 != null){
										 System.out.println("pro4_imgFile 크기 : "+file4.length());
									 }
									 break;
			case "pro5_imgFile" :    pro5_imgFile = (String)en.nextElement();
									 String filename5 = multi.getFilesystemName(pro5_imgFile);
									 String original5 = multi.getOriginalFileName(pro5_imgFile);
									 String type5 = multi.getContentType(pro5_imgFile);
									 File file5 = multi.getFile(pro5_imgFile);
				
									 System.out.println("파라메타 이름 : "+pro5_imgFile);
									 System.out.println("실제파일이름 : "+original5);
									 System.out.println("저장된 파일이름 : "+filename5);
									 System.out.println("파일 타입 : "+ type5);
									 if(file5 != null){
										 System.out.println("pro5_imgFile 크기 : "+file5.length());
									 }
									 break;
			default : break;
			}
			*/
			
			
			
			String filename1 = (String)en.nextElement();
			String filename = multi.getFilesystemName(filename1);
			String original = multi.getOriginalFileName(filename1);
			String type = multi.getContentType(filename1);
			File file = multi.getFile(filename1);
			
			System.out.println("real Path : "+realPath);
			System.out.println("파라메타 이름 : "+filename1);
			System.out.println("실제파일이름 : "+original);
			System.out.println("저장된 파일이름 : "+filename);
			System.out.println("파일 타입 : "+ type);
			if(file != null){
				System.out.println("크기 : "+file.length());
			}

		}
		/*System.out.println("pro_contentFile 이름 : "+pro_contentFile);
		System.out.println("pro_imgFile 이름 : "+pro_imgFile);
		System.out.println("pro2_imgFile 이름 : "+pro2_imgFile);
		System.out.println("pro3_imgFile 이름 : "+pro3_imgFile);
		System.out.println("pro4_imgFile 이름 : "+pro4_imgFile);
		System.out.println("pro5_imgFile 이름 : "+pro5_imgFile);*/
		

		
		System.out.println("상품명 ==>"+ pro_name);
		System.out.println("상품가격 ==>"+ price);
		System.out.println("재고수 ==>"+ stock);
		System.out.println("원산지 ==>"+ origin);
		System.out.println("제조사 ==>"+ pro_made);
		System.out.println("상품판매상태 ==>"+ pro_state);
		
		/*Board board = new Board();
		
		System.out.println("0 = > "+ pageNum);
		System.out.println("1 = > "+ num);
		System.out.println("2 = > "+ ref);
		System.out.println("3 = > "+ re_level);
		System.out.println("4 = > "+ re_step);
		System.out.println("5 = > "+ subject);
		System.out.println("6 = > "+ writer);
		System.out.println("7 = > "+ email);
		System.out.println("8 = > "+ content);
		System.out.println("9 = > "+ passwd);
		System.out.println("-------------------------------------------------");*/
		try {
			/*BoardDao bd = BoardDao.getInstance();
			board.setNum(num);
			board.setRef(ref);
			board.setRe_level(re_level);
			board.setRe_step(re_step);
			board.setSubject(subject);
			board.setWriter(writer);
			board.setEmail(email);
			board.setContent(content);
			board.setPasswd(passwd);
			board.setIp(request.getRemoteAddr());
			
			int result = bd.insert(board);
			request.setAttribute("num", num);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);*/
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally {
			
		}
		return "pro_registPro.jsp";
	}

}
