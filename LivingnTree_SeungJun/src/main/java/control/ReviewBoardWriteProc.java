package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LivingDAO;
import model.MemberDTO;
import model.ReviewDTO;

@WebServlet("/ReviewBoardWriteProc.do")
public class ReviewBoardWriteProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		ReviewDTO rdto = new ReviewDTO();
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		String code = request.getParameter("p_code");
		
		System.out.println("상품코드 :" + code);
		
		rdto.setR_pw(request.getParameter("password"));
		rdto.setP_code(Integer.parseInt(code));
		rdto.setR_title(request.getParameter("subject"));
		rdto.setR_content(request.getParameter("content"));
		rdto.setM_name(ldao.getOneName(loginId));
		rdto.setM_id(loginId);
		
		ldao.insertReviewBoard(rdto);
		// insert를 하게되면 새로고침 할때마다 데이터가 DB에 저장되기때문에 response.sendRedirect로 페이지를 떠넘김을 주의 하자!!
		response.sendRedirect("ReviewBoardList.do");
		//RequestDispatcher rd = request.getRequestDispatcher("ReviewBoardList.do");
		//rd.forward(request, response);
	}
}