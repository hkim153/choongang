package service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Store;
import dao.StoreDao;

public class WH_ProregistProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		StoreDao sd = StoreDao.getInstance();
		int maxSize = 10 * 1024 * 1024;
		String imagefile = "/product_img";
		String realPath = request.getServletContext().getRealPath(imagefile);
		System.out.println("realPath ==>"+ realPath);

		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		System.out.println("---------        WriteProAction          --------");
		
		String b_code = multi.getParameter("b_code");                             //대분류
		String m_code = multi.getParameter("m_code");                             //중분류
		String s_code = multi.getParameter("s_code");				              //소분류
		String pro_code = b_code+m_code+s_code;                                   //상품코드
		String pro_name = multi.getParameter("pro_name");                         //상품명
		String seller = multi.getParameter("seller");                             //판매자
		int price = Integer.parseInt(multi.getParameter("price"));                //상품가격
		int stock = Integer.parseInt(multi.getParameter("stock"));                //재고수
		String origin = multi.getParameter("origin");                             //원산지
		String pro_made = multi.getParameter("pro_made");                         //제조사
		int pro_state = Integer.parseInt(multi.getParameter("pro_state"));  //상품판매상태
		String pro_contentFile = "";
		String pro1_imgFile = "";
		String pro2_imgFile = "";
		String pro3_imgFile = "";
		String pro4_imgFile = "";
		String pro5_imgFile = "";
		// --------------------------------------------------------------------------------//
		Store store = new Store();
		store.setPro_code(Integer.parseInt(pro_code));
		store.setPro_name(pro_name);
		store.setPrice(price);
		store.setSeller(seller);
		store.setStock(stock);
		store.setOrigin(origin);
		store.setPro_made(pro_made);
		store.setPro_state(pro_state);
		
		try {
			int result = sd.insert(store);
			request.setAttribute("result", result);
			System.out.println("result ==>" + result);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}  
		Enumeration en = multi.getFileNames();
		while (en.hasMoreElements()){
			String filename1 = (String)en.nextElement();
			switch(filename1) {
			case "pro_contentFile" : pro_contentFile = filename1;
									 String cfilename = multi.getFilesystemName(pro_contentFile);
									 String coriginal = multi.getOriginalFileName(pro_contentFile);
									 String ctype = multi.getContentType(pro_contentFile);
									 File cfile = multi.getFile(pro_contentFile);
				
									 System.out.println("파라메타 이름 : "+pro_contentFile);
									 System.out.println("실제파일이름 : "+coriginal);
									 System.out.println("저장된 파일이름 : "+cfilename);
									 System.out.println("파일 타입 : "+ ctype);
									 if(cfile != null){
									 	System.out.println("pro_contentFile 크기 : "+cfile.length());
									 }
									 store.setImg_folder(imagefile);
									 store.setFile_name(cfilename);
									 store.setReal_name(coriginal);
									 store.setImg_num(0);
										try {
											int result_c = sd.insert_img(store);
											request.setAttribute("result_c", result_c);
										} catch (SQLException e) {
											System.out.println(e.getMessage());
										}
									 break;
			case "pro1_imgFile":	     pro1_imgFile = filename1;
									 String filename = multi.getFilesystemName(pro1_imgFile);
									 String original = multi.getOriginalFileName(pro1_imgFile);
									 String type = multi.getContentType(pro1_imgFile);
									 File file = multi.getFile(pro1_imgFile);
				
									 System.out.println("파라메타 이름 : "+pro1_imgFile);
									 System.out.println("실제파일이름 : "+original);
									 System.out.println("저장된 파일이름 : "+filename1);
									 System.out.println("파일 타입 : "+ type);
									 if(file != null){
										 System.out.println("pro_imgFile 크기 : "+file.length());
									 }
									 store.setImg_folder(imagefile);
									 store.setFile_name(filename);
									 store.setReal_name(original);
									 store.setImg_num(1);
										try {
											int result_1 = sd.insert_img(store);
											request.setAttribute("result_1", result_1);
										} catch (SQLException e) {
											System.out.println(e.getMessage());
										}
									 break;
			case "pro2_imgFile":     pro2_imgFile = filename1;
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
									 store.setImg_folder(imagefile);
									 store.setFile_name(filename2);
									 store.setReal_name(original2);
									 store.setImg_num(2);
										try {
											int result_2 = sd.insert_img(store);
											request.setAttribute("result_2", result_2);
										} catch (SQLException e) {
											System.out.println(e.getMessage());
										}	
									 break;
			case "pro3_imgFile" :    pro3_imgFile = filename1;
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
									 store.setImg_folder(imagefile);
									 store.setFile_name(filename3);
									 store.setReal_name(original3);
									 store.setImg_num(3);
										try {
											int result_3 = sd.insert_img(store);
											request.setAttribute("result_3", result_3);
										} catch (SQLException e) {
											System.out.println(e.getMessage());
										}	
									 break;
			case "pro4_imgFile" :    pro4_imgFile = filename1;
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
									 store.setImg_folder(imagefile);
									 store.setFile_name(filename4);
									 store.setReal_name(original4);
									 store.setImg_num(4);
										try {
											int result_4 = sd.insert_img(store);
											request.setAttribute("result_4", result_4);
										} catch (SQLException e) {
											System.out.println(e.getMessage());
										}	
									 break;
			case "pro5_imgFile" :    pro5_imgFile = filename1;
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
									 store.setImg_folder(imagefile);
									 store.setFile_name(filename5);
									 store.setReal_name(original5);
									 store.setImg_num(5);
										try {
											int result_5 = sd.insert_img(store);
											request.setAttribute("result_5", result_5);
										} catch (SQLException e) {
											System.out.println(e.getMessage());
										}	
									 break;
									
			default : break;
			}
					
		}
		
		System.out.println("상품명 ==>"+ pro_name);
		System.out.println("상품가격 ==>"+ price);
		System.out.println("재고수 ==>"+ stock);
		System.out.println("원산지 ==>"+ origin);
		System.out.println("제조사 ==>"+ pro_made);
		System.out.println("상품판매상태 ==>"+ pro_state);
		
		return "wh_proregistPro.jsp";
	}

}
