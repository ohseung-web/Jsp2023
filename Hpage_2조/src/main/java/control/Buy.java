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

@WebServlet("/Buy.do")
public class Buy extends HttpServlet {
       
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
		
		TeteumDAO tdao = new TeteumDAO();
		TeteumDTO tdto = new TeteumDTO();
		
		ArrayList<TeteumDTO> al = new ArrayList<>();
		
		String no[] = request.getParameterValues("no");
		String img[] = request.getParameterValues("img");
		String name[] = request.getParameterValues("name");
		String color[] = request.getParameterValues("color");
		String cnt[] = request.getParameterValues("cnt");
		String price[] = request.getParameterValues("price");
		
		int buynum = tdao.noSelect();
		
		for(int i = 0; i < no.length; i++) {
			tdto.setBuy_date(tdto.getBuy_date());
			tdto.setBuy_num(buynum);
			tdto.setB_num(no[i]);
			tdto.setB_img(img[i]);
			tdto.setB_name(name[i]);
			tdto.setB_color(color[i]);
			tdto.setB_cnt(Integer.parseInt(cnt[i]));
			tdto.setB_price(Integer.parseInt(price[i]));
			tdto.setId(id);
			
			al.add(tdto); // 한 행씩 추가하는 코드
			tdao.insertBuyProduct(tdto);
		}
		
		String deliveryname = request.getParameter("deliveryname");
		String deliveryzipcd = request.getParameter("deliveryzipcd");
		String deliveryaddress1 = request.getParameter("deliveryaddress1");
		String deliveryaddress2 = request.getParameter("deliveryaddress2");
		String deliveryphone1 = request.getParameter("deliveryphone1");
		String deliveryphone2 = request.getParameter("deliveryphone2");
		String deliveryphone3 = request.getParameter("deliveryphone3");
		String deliveryphone = deliveryphone1 + "-" + deliveryphone2 + "-" + deliveryphone3;
		String deliveryrequest = request.getParameter("deliveryrequest");
		
		tdto.setBuy_date(tdto.getBuy_date());
		tdto.setBuy_num(tdto.getBuy_num());
		tdto.setD_name(deliveryname);
		tdto.setD_phone(deliveryphone);
		tdto.setD_zipcode(deliveryzipcd);
		tdto.setD_roadaddress(deliveryaddress1);
		tdto.setD_detailaddress(deliveryaddress2);
		tdto.setD_deliveryrequest(deliveryrequest);
		tdto.setId(id);
		
		tdao.insertDeliveryAddress(tdto);
		
		for(int i = 0; i < no.length; i++) {
			tdao.deleteCart((no[i]));
		}
		
		ArrayList<TeteumDTO> arl = new ArrayList<>();
		
		for(int i = 0; i < no.length; i++) {
			tdto.setB_num(no[i]);
			tdto.setId(id);
			
			tdto = tdao.getPurchaseProduct(tdto);
			
			arl.add(tdto);
		}
		
		session.setAttribute("arl", arl);
		
		session.setAttribute("cartcnt", null);
		
		request.setAttribute("Buy_date", tdto.getBuy_date());
		request.setAttribute("Buy_num", tdto.getBuy_num());
		
		request.setAttribute("buysuccess", "구매가 완료되었습니다.");
		
		RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
		dis.forward(request, response);
	}

}
