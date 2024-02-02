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

@WebServlet("/OrderOne.do")
public class OrderOne extends HttpServlet {
	
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
		
		if(id == null) {
			request.setAttribute("loginessential", "로그인 후 이용 가능합니다.");
			
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
			
		}else {
			String no = request.getParameter("p_no");
			String img = request.getParameter("p_img");
			String name = request.getParameter("p_name");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			int price = Integer.parseInt(request.getParameter("productprice").replaceAll(",", ""));
			String color = request.getParameter("color");
			
			if(color.equals("ncolor")) { // 색상선택이 없는 경우
				TeteumDAO tdao = new TeteumDAO();
				TeteumDTO tdto = new TeteumDTO();
				
				ArrayList<TeteumDTO> al = new ArrayList<>();
				
				tdto.setC_no(no);
				tdto.setC_cnt(cnt);
				tdto.setC_img(img);
				tdto.setC_name(name);
				tdto.setC_price(price);
				tdto.setC_color(color);
				
				al.add(tdto);
				
				request.setAttribute("sum_price", tdto.getC_price());
				
				request.setAttribute("al", al);
				
				tdto = tdao.getMemberInfo(id);
				
				request.setAttribute("id", tdto.getId());
				request.setAttribute("email", tdto.getEmail());
				request.setAttribute("name", tdto.getName());
				request.setAttribute("password", tdto.getPassword());
				request.setAttribute("phone", tdto.getPhone());
				request.setAttribute("zipcode", tdto.getZipcode());
				request.setAttribute("roadaddress", tdto.getRoadaddress());
				request.setAttribute("agreeterms", tdto.getAgree_terms());
				request.setAttribute("agreeage", tdto.getAgree_age());
				request.setAttribute("agreeemail", tdto.getAgree_email());
				request.setAttribute("detailaddress", tdto.getDetailaddress());
				request.setAttribute("agreemessage", tdto.getAgree_message());
				
				RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=OrderList.jsp");
				dis.forward(request, response);
			}else if(color.equals("option")) { // 색상 선택을 안했을 경우
				request.setAttribute("chooseoption", "옵션을 선택해주세요");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
			}else { // 색상 선택이 있는 경우
				TeteumDAO tdao = new TeteumDAO();
				TeteumDTO tdto = new TeteumDTO();
				
				ArrayList<TeteumDTO> al = new ArrayList<>();
				
				tdto.setC_no(no);
				tdto.setC_cnt(cnt);
				tdto.setC_img(img);
				tdto.setC_name(name);
				tdto.setC_price(price);
				tdto.setC_color(color);
				
				al.add(tdto);
				
				request.setAttribute("sum_price", tdto.getC_price());
				
				request.setAttribute("al", al);
				
				tdto = tdao.getMemberInfo(id);
				
				request.setAttribute("id", tdto.getId());
				request.setAttribute("email", tdto.getEmail());
				request.setAttribute("name", tdto.getName());
				request.setAttribute("password", tdto.getPassword());
				request.setAttribute("phone", tdto.getPhone());
				request.setAttribute("zipcode", tdto.getZipcode());
				request.setAttribute("roadaddress", tdto.getRoadaddress());
				request.setAttribute("agreeterms", tdto.getAgree_terms());
				request.setAttribute("agreeage", tdto.getAgree_age());
				request.setAttribute("agreeemail", tdto.getAgree_email());
				request.setAttribute("detailaddress", tdto.getDetailaddress());
				request.setAttribute("agreemessage", tdto.getAgree_message());
				
				RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=OrderList.jsp");
				dis.forward(request, response);
			}
		}
	}

}
