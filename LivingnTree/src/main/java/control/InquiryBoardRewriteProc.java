package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InquiryDTO;
import model.LivingDAO;
// import model.MemberDTO;

@WebServlet("/InquiryBoardRewriteProc.do")
public class InquiryBoardRewriteProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		InquiryDTO idto = new InquiryDTO();
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		// int code = 0;
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		
		idto.setI_pw(request.getParameter("password"));
		idto.setP_code(p_code);
		/* idto.setP_code(Integer.parseInt(code)); */
		idto.setI_title(request.getParameter("subject"));
		idto.setI_content(request.getParameter("content"));
		idto.setM_name(ldao.getOneName(loginId));
		idto.setM_id(loginId);
		idto.setRef(Integer.parseInt(request.getParameter("ref")));
		idto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		
		ldao.rewriteInsertInquiryBoard(idto);
		// insert를 하게 되면 새로고침 할 때마다 데이터가 DB에 저장되기 때문에 response.sendRedirect로 페이지를 떠넘김을 주의하자!!
		response.sendRedirect("InquiryBoardList.do");
		// RequestDispatcher rd = request.getRequestDispatcher("InquiryBoardList.do");
		// rd.forward(request, response);
	}
}