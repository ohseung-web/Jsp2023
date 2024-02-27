package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DelivDTO;
import model.InquiryDTO;
import model.LivingDAO;
import model.ReviewDTO;


@WebServlet("/MyShopdelivaddress.do")
public class MyShopdelivaddress extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		LivingDAO ldao = new LivingDAO();
		
		int pageSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		
		int count = 0;
		int number = 0;
		
		int currentPage = Integer.parseInt(pageNum);
		
		// 회원별 Delivaddress 개수
		count = ldao.getOneDelivaddressCount(loginId);
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		// 회원별 Delivaddress
		ArrayList<DelivDTO> aList = ldao.getOneDelivaddress(startRow, pageSize, loginId);
		
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
		
		request.setAttribute("aList", aList);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=MyShopdelivaddress.jsp");
		rd.forward(request, response);
	}
}
