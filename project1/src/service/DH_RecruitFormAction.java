package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RecruitDao;
import dao.fish;

public class DH_RecruitFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecruitDao rd = RecruitDao.getInstance();

		try {
			List<fish> f_species = rd.f_species();
			request.setAttribute("f_species", f_species);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	
		return "dh_recruit.jsp";
	}

}
