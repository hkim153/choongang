package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Store;
import dao.StoreDao;

public class WH_ProContentFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao sd = StoreDao.getInstance();
		request.setCharacterEncoding("utf-8");
		int pro_num = Integer.parseInt(request.getParameter("pro_num"));
		int pro_code = Integer.parseInt(request.getParameter("pro_code"));
		try {
			List<Store>	proContent_img = sd.proContent_img(pro_num, pro_code);
			Store proContent = sd.proContent(pro_num, pro_code);
			request.setAttribute("proContent", proContent);
			request.setAttribute("proContent_img", proContent_img);
			String first_img = proContent_img.get(0).getImg_folder()+"/"+proContent_img.get(0).getReal_name();
			request.setAttribute("first_img", first_img);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "wh_proContentForm.jsp";
	}

}
