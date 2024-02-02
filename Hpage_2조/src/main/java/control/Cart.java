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
		
		if(id == null) { // 로그인 여부 체크
			request.setAttribute("loginessential", "로그인 후 이용 가능합니다.");
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
			
			if(color.equals("ncolor")) { // 색상선택이 없는 경우
				TeteumDTO tdto = new TeteumDTO();
				TeteumDAO tdao = new TeteumDAO();
				
				int count = tdao.getSameCart(id, p_no, color);
				
				if(count == 0) {
					int p_num = tdao.noCart(); //장바구니 번호증가 함수
					
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
			}else if(color.equals("option")) { // 색상 선택을 안했을 경우
				request.setAttribute("chooseoption", "옵션을 선택해주세요");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
				
			}else { // 색상 선택이 있는 경우
				TeteumDTO tdto = new TeteumDTO();
				TeteumDAO tdao = new TeteumDAO();
				
				int count = tdao.getSameCart(id, p_no, color);
				
				if(count == 0) {
					int p_num = tdao.noCart(); //장바구니 번호증가 함수
					
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
				
				request.setAttribute("cartsuccess", "장바구니담기 완료");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
			}
		
		}
	}
}
