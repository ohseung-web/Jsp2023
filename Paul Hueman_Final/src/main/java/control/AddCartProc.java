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

@WebServlet("/AddCart.do")

public class AddCartProc extends HttpServlet {
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
		String log = (String)session.getAttribute("paul_login");//�������̵� ����
		if(log != null) {//u_id�� ���� �Ѵٸ�. �� �̹� �α��� ���ִ� ���¶��
			int c_cnt = Integer.parseInt(request.getParameter("c_cnt")); 		// ��ٱ��Ͽ� ��� ����
			String p_name = request.getParameter("p_name");  					// ��ǰ�̸�
			String p_color = request.getParameter("p_color"); 					//��ǰ����
			int p_price = Integer.parseInt(request.getParameter("p_price")); 	//��ǰ����
			CartDAO cdao = new CartDAO();
			int dbcnt = cdao.getCount(p_name, p_color, log);
			if(dbcnt == 0) {
				//AfterAdded�� ���� alert�� itemList ȭ�����ΰ���
				cdao.insertCart(c_cnt, p_name, p_color, p_price, log);
				request.setAttribute("status", "success");
			} else if((c_cnt + dbcnt) > 0 && (c_cnt + dbcnt) <= 9999) {
				cdao.AddCount(p_name, p_color, log, c_cnt);
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "countover");
			}
		} else {
			request.setAttribute("status", "logerror");
		}
		RequestDispatcher dis = request.getRequestDispatcher("CartAfterAdded.jsp");
		dis.forward(request, response);
	}
}
