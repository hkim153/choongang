package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Fishingsite;
import dao.FishingsiteDao;

public class HS_AddFishingSiteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		FishingsiteDao fsd = FishingsiteDao.getInstance();
		try {
			//현재 db에 있는 게시글 갯수
			int totCnt  = fsd.getTotalCnt();
			//페이지 번호 클릭시 페이지 번호 파라미터 받기
			String pageNum = request.getParameter("pageNum");	
			//메인에서 게시판 불러올 시 페이지 번호 안 넘겨서 1로 설정
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			int currentPage = Integer.parseInt(pageNum);	
			//pageSize는 한페이지의 최대 게시글, blockSize는 한번에 볼수 있는 최대 페이지 갯수
			int pageSize  = 10, blockSize = 5;
			// startRow, endRow 현재 페이지의 게시글 db에서 가져올때 필요한 부분 영역
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow   = startRow + pageSize - 1;
			//startNum 현재 페이지의 가장 큰 번호
			int startNum = totCnt - startRow + 1; 
			//게시글 db에서 리스트 형태로 가져오기 
			List<Fishingsite> list = fsd.list(startRow, endRow);
			
			//pageCnt 총 페이지 갯수
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			//startPage: 현재 창에서 페이지 시작 번호
			
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			//endPage: 현재창의 페이지 시작번호에서 blocksize 더한것
			int endPage = startPage + blockSize -1;	
			//endPage: 하지만 마지막 창에는 blocksize보다 작은 페이지 갯수가 남아 있을 수 있으므로, pageCnt 보다 크면 endPage를 pageCnt 로 변경
			if (endPage > pageCnt) endPage = pageCnt;	
			//blocksize가 3이고 PageCnt 가 8일때
			//예를 들어 창1: 1,2,3[다음] 창2: [이전]4,5,6[다음] 창3:[이전]7,8 
			//startPage는 1,4,7이고 endPage는 3,6,8이다
			//마지막 창에는 9까지 없고 8까지 있어서 endPage(9)를 PageCnt(8)로 변경
		
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
		}catch(Exception e) { System.out.println(e.getMessage()); }
		
		return "hs_addFishingSiteForm.jsp";
	}

}
