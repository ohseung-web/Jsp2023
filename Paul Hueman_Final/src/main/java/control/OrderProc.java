package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDAO;

@WebServlet("/Order.do")
public class OrderProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");
		CartDAO cdao = new CartDAO();
		int num = cdao.getOrderNumber();
		request.setAttribute("num", num);
		String user = request.getParameter("userName");
		String zipcode = request.getParameter("zipcode");
		String roadAddr = request.getParameter("roadAddr");
		String detailAddr = request.getParameter("detailAddr");
		String extraAddr = request.getParameter("extraAddr");
		String addr = roadAddr;
		if(extraAddr != "") addr += " " + extraAddr;
		if(detailAddr != "") addr += " " + detailAddr;
		String tel = request.getParameter("tel");
		int total = Integer.parseInt(request.getParameter("total"));
		String payer = request.getParameter("payer");
		cdao.InsertOrder(num, user, zipcode, addr, tel, total, payer, log);
		String[] item = request.getParameterValues("itemName");
		String[] color = request.getParameterValues("color");
		String[] cntlist = request.getParameterValues("cnt");
		String[] sumlist = request.getParameterValues("sum");
		int[] cnt = new int[cntlist.length];
		int[] sum = new int[sumlist.length];
		for(int i = 0; i < cnt.length; i++) {
			cnt[i] = Integer.parseInt(cntlist[i]);
			sum[i] = Integer.parseInt(sumlist[i]);
		}
		cdao.InsertOrderProduct(item, color, cnt, sum, num);
		String[] nolist = request.getParameterValues("no");
		if(nolist != null) {
			int[] no = new int[nolist.length];
			for(int i = 0; i < no.length; i++) {
				no[i] = Integer.parseInt(nolist[i]);
			}
			cdao.convertCart(no);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
