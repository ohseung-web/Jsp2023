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

import model.BuyDAO;
import model.PaulDTO;

@WebServlet("/Buy.do")

public class BuyProc extends HttpServlet {
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
	
		if(log != null) {//이미 로그인 되있는 상태라면			
			
			BuyDAO bdao= new BuyDAO();
			ArrayList<PaulDTO> orderlist = bdao.getOrder(log);
			if(orderlist != null){
				request.setAttribute("orderlist", orderlist);
				
				int[] orderNum = new int[orderlist.size()];//주문번호의 배열 생성
				for(int i =0;i< orderNum.length ;i++){
					orderNum[i] =orderlist.get(i).getO_no(); 
				}
				
				ArrayList<PaulDTO> productlist =bdao.getOrderProduct(orderNum);
				if(productlist != null) request.setAttribute("productlist", productlist);		
			}
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Buy.jsp");
			dis.forward(request, response);
			
		}else {
			request.setAttribute("BoardLogin", "로그인 후 이용 가능합니다.");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}

	}
}
