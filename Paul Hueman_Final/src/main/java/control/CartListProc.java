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

import model.CartDAO;
import model.PaulDTO;

@WebServlet("/CartList.do")

public class CartListProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");//유저아이디 세션
	
		if(log != null) {//u_id가 존재 한다면. 즉 이미 로그인 되있는 상태라면
			
			CartDAO cdao = new CartDAO();
			ArrayList<PaulDTO> cartList = cdao.getCart(log);
			request.setAttribute("cartList", cartList);
			
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Cart.jsp");
			dis.forward(request, response);
			
		}else {
			request.setAttribute("BoardLogin", "로그인 후 이용 가능합니다.");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		
	}


}
