package control;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LivingDAO;
import model.MemberDTO;
import model.OrderHistDTO;

@WebServlet("/MyShop.do")
public class MyShop extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		}catch(ServletException | IOException | ParseException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		}catch(ServletException | IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = ldao.getMemberByLoginId(loginId);
		
		// 구매일자와 오늘일자를 비교하여 오늘일자가 구매일자보다 크면 '배송완료' 아니면 '배송준비중' 출력
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date(); // 오늘날짜
		Date orderday = new Date(); // 구매일자
		
		today = sdf.parse(sdf.format(today));
		
		// 페이징 코드
        int pageSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		
		int count = 0;
		int number = 0;
		
		int currentPage = Integer.parseInt(pageNum);
		
        count = ldao.getOrdersByCount(loginId); // 주문조회 개수
        // 게시글 개수
       int  countboard = ldao.getOneMemberReviewCount(loginId) + ldao.getOneMemberInquiryCount(loginId);
		// 배송주소록 개수
       int countdeliva = ldao.getOneDelivaddressCount(loginId);
        
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		ArrayList<OrderHistDTO> oharr = ldao.getOrdersByLoginId(loginId,startRow,pageSize);

		// OrderHistDTO의 오늘날짜와 구매일자를 비교하여 배송여부를 delivchk에 저장한다.
		for(int i=0;i<oharr.size();i++) {
			orderday = sdf.parse(oharr.get(i).getO_date());
			if(orderday.equals(today)) {
				oharr.get(i).setDelivchk("배송준비중");
			}else {
				oharr.get(i).setDelivchk("배송완료");
			}
		}
		
		number = count - (currentPage - 1) * pageSize;
		
		int pageCount = 0;
		int pageBlock = 3;
		int startPage = 1;
		int endPage = 0;
		
		if(count>0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			
			if(currentPage % pageBlock != 0) {
				startPage = (currentPage / pageBlock) * pageBlock + 1;
			}else {
				startPage = ((currentPage / pageBlock)-1) * pageBlock + 1;
			}
			
			endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		}
		// 페이징 코드 완료
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("countboard", countboard);
		request.setAttribute("countdeliva", countdeliva);
		
		request.setAttribute("oharr", oharr);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=MyShop.jsp");
		rd.forward(request, response);
	}
}