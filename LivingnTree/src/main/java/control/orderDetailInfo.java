package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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


@WebServlet("/orderDetailInfo.do")
public class orderDetailInfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		} catch (ServletException | IOException | ParseException e) {
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
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		String o_date = request.getParameter("o_date");
		String o_code = request.getParameter("o_code");
		String p_code = request.getParameter("p_code");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = ldao.getMemberByLoginId(loginId);
		// 한 사람의 주문조회 정보를 주문일자, 주문코드, 상품코드 별로 저장하여 담는다.
		OrderHistDTO odto = ldao.getOneOrdersByLoginId(loginId, o_date, Integer.parseInt(o_code), Integer.parseInt(p_code));
		
		//주문일자를 숫자로 형식을 변경하여 준다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date orderDate = new Date();
		orderDate = sdf.parse(odto.getO_date());
		
		request.setAttribute("loginId", loginId);
		request.setAttribute("odto", odto);
		request.setAttribute("mdto", mdto);
		request.setAttribute("orderDate", orderDate); 
		RequestDispatcher rdis = request.getRequestDispatcher("Main.jsp?section=OrderDetailInfo.jsp");
		rdis.forward(request, response);
		
		
	}
}
