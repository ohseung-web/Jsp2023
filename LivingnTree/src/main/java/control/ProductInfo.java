package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InquiryDTO;
import model.LivingDAO;
import model.ProductDTO;
import model.ReviewDTO;

@WebServlet("/ProductInfo.do")
public class ProductInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("p_code"));
		LivingDAO ldao = new LivingDAO();
		ProductDTO pdto = ldao.getOneProduct(code);
		
		int pageSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		
		int count = 0;
		int number = 0;
		
		int currentPage = Integer.parseInt(pageNum);
		
		// 상품코드별 리뷰 개수
		count = ldao.getOneProductReviewCount(code);
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		// 상품코드별 리뷰
		ArrayList<ReviewDTO> aList = ldao.getOneProductReviewBoard(startRow, pageSize, code);
		
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
		
		/////////////////////////////////////////////////////////		
		
		String pageNum2 = request.getParameter("pageNum2");
		if(pageNum2==null) {
			pageNum2 = "1";
		}
		
		int count2 = 0;
		int number2 = 0;
		
		int currentPage2 = Integer.parseInt(pageNum2);
		
		// 상품코드별 문의글 개수 ?
		count2 = ldao.getOneProductInquiryCount(code);
		
		int startRow2 = (currentPage2 - 1) * pageSize + 1;
		int endRow2 = currentPage2 * pageSize;
		// 상품코드별 문의글 ?
		ArrayList<InquiryDTO> aList2 = ldao.getOneProductInquiryBoard(startRow2, pageSize, code);
		
		number2 = count2 - (currentPage2 - 1) * pageSize;
		
		int pageCount2 = 0;
		int pageBlock2 = 3;
		int startPage2 = 1;
		int endPage2 = 0;
		
		if(count2>0) {
			pageCount2 = count2 / pageSize + (count2 % pageSize == 0 ? 0 : 1);
			
			if(currentPage2 % pageBlock2 != 0) {
				startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1;
			}else {
				startPage2 = ((currentPage2 / pageBlock2)-1) * pageBlock2 + 1;
			}
			
			endPage2 = startPage2 + pageBlock2 - 1;
			
			if(endPage2 > pageCount2) {
				endPage2 = pageCount2;
			}
		}
		
		
		String msg = (String)request.getAttribute("msg");
		request.setAttribute("msg", msg);
		
		request.setAttribute("aList", aList);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("aList2", aList2);
		request.setAttribute("number2", number2);
		/* request.setAttribute("pageSize2", pageSize2); */
		request.setAttribute("count2", count2);
		request.setAttribute("currentPage2", currentPage2);
		
		request.setAttribute("pageCount2", pageCount2);
		request.setAttribute("pageBlock2", pageBlock2);
		request.setAttribute("startPage2", startPage2);
		request.setAttribute("endPage2", endPage2);
		
		request.setAttribute("pdto", pdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=ProductInfo.jsp");
		rd.forward(request, response);
	}
}
