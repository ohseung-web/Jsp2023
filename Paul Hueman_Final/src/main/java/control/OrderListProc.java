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

@WebServlet("/OrderList.do")

public class OrderListProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderListProc() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");
		CartDAO cdao = new CartDAO();
		PaulDTO user = cdao.getUser(log);
		request.setAttribute("user", user);
		String[] itemlist = request.getParameterValues("item");
		int[] item = new int[itemlist.length];
		for(int i = 0; i < itemlist.length; i++){
			item[i] = Integer.parseInt(itemlist[i]);
		}
		PaulDTO[] orderlist = cdao.getOrderlist(item);
		request.setAttribute("orderlist", orderlist);
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Order.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
