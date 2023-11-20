package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDAO;
import model.PaulDTO;

@WebServlet("/BuyNow.do")
public class BuyNowProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuyNowProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");
		CartDAO cdao = new CartDAO();
		PaulDTO user = cdao.getUser(log);
		request.setAttribute("user", user);
		String p_name = request.getParameter("p_name");
		String p_color = request.getParameter("p_color");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		int c_cnt = Integer.parseInt(request.getParameter("c_cnt"));
		PaulDTO[] orderlist = new PaulDTO[1];
		PaulDTO pdto = new PaulDTO();
		pdto.setP_name(p_name);
		pdto.setP_color(p_color);
		pdto.setP_price(p_price);
		pdto.setC_cnt(c_cnt);
		orderlist[0] = pdto;
		request.setAttribute("orderlist", orderlist);
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Order.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
