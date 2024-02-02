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

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/Cart.do")
public class Cart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		if(id == null) { // �α��� ���� üũ
			request.setAttribute("loginessential", "�α��� �� �̿� �����մϴ�.");
			request.setAttribute("section", "Login.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
			
		}else {
			String p_no = request.getParameter("p_no");
			String p_name = request.getParameter("p_name");
			String cnt = request.getParameter("cnt");
			int productcnt = Integer.parseInt(cnt);
			String producttot = request.getParameter("productprice").replaceAll(",", "");
			int productprice = Integer.parseInt(producttot);
			String color = request.getParameter("color");
			String p_img = request.getParameter("p_img");
			
			if(color.equals("ncolor")) { // �������� ���� ���
				TeteumDTO tdto = new TeteumDTO();
				TeteumDAO tdao = new TeteumDAO();
				
				int count = tdao.getSameCart(id, p_no, color);
				
				if(count == 0) {
					int p_num = tdao.noCart(); //��ٱ��� ��ȣ���� �Լ�
					
					tdto.setC_num(p_num);
					tdto.setC_no(p_no);
					tdto.setC_name(p_name);
					tdto.setC_cnt(productcnt);
					tdto.setC_price(productprice);
					tdto.setC_color(color);
					tdto.setC_img(p_img);
					tdto.setId(id);
					
					tdao.insertCart(tdto);
					
				}else {
					tdao.updateSameCart(p_no, color, productcnt);
				}
			}else if(color.equals("option")) { // ���� ������ ������ ���
				request.setAttribute("chooseoption", "�ɼ��� �������ּ���");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
				
			}else { // ���� ������ �ִ� ���
				TeteumDTO tdto = new TeteumDTO();
				TeteumDAO tdao = new TeteumDAO();
				
				int count = tdao.getSameCart(id, p_no, color);
				
				if(count == 0) {
					int p_num = tdao.noCart(); //��ٱ��� ��ȣ���� �Լ�
					
					tdto.setC_num(p_num);
					tdto.setC_no(p_no);
					tdto.setC_name(p_name);
					tdto.setC_cnt(productcnt);
					tdto.setC_price(productprice);
					tdto.setC_color(color);
					tdto.setC_img(p_img);
					tdto.setId(id);
					
					tdao.insertCart(tdto);
					
				}else {
					tdao.updateSameCart(p_no, color, productcnt);
				
				}
				
				session.setAttribute("p_no", p_no);
				
				request.setAttribute("cartsuccess", "��ٱ��ϴ�� �Ϸ�");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
			}
		
		}
	}
}
