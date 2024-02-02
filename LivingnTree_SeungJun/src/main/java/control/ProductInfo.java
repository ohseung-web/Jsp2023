package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;
import model.ProductDTO;

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
		
		// ReviewDTO rdto = new ReviewDTO();
		// InquiryDTO idto = new InquiryDTO();
		// 상품 코드로 리뷰/문의글 개수를 구하는 메서드
		// int rcnt = ldao.getReviewCount(int code);
		// int icnt = ldao.getInquiryCount(int code);
		// 상품 코드에 해당하는 리뷰/문의글 전체를 가져오는 메서드
		// ArrayList<ReviewDTO> rList = ldao.getSomeReview(int code);
		// ArrayList<InquiryDTO> iList = ldao.getSomeReview(int code)
		
		request.setAttribute("pdto", pdto);
		// request.setAttribute("rcnt", rcnt);
		// request.setAttribute("icnt", icnt);
		// request.setAttribute("rList", rList);
		// request.setAttribute("iList", iList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=ProductInfo.jsp");
		rd.forward(request, response);
	}
}
