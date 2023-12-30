package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyDTO;
import model.JangDAO;
import model.JangDTO;
import model.ProductDTO;

@WebServlet("/ToOrderListProc.do")
public class ToOrderListProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BuyDTO bdto = new BuyDTO();
		JangDAO jdao = new JangDAO();
		ProductDTO pdto = new ProductDTO();
		ArrayList<ProductDTO> arr = new ArrayList<>();
		
		// 동시에 여러 상품을 주문할 수 있기때문에 orderList.jsp 넘어오는 데이터를 모두 배열에 저장한다.
		String [] noarr = request.getParameterValues("no");
		String [] imgarr = request.getParameterValues("img");
		String [] namearr = request.getParameterValues("name");
		String [] cntarr = request.getParameterValues("cnt");
		String [] pricearr = request.getParameterValues("price");
		
		int orderNo = jdao.noaddSelect();
		String phone01 = request.getParameter("phone01");
		String phone02 = request.getParameter("phone02");
		String phone03 = request.getParameter("phone03");
		String detailAddress = request.getParameter("detailAddress");
		String loginId = request.getParameter("rentlogin");
		
		// order_product 테이블에 insert
		for(int i=0; i<noarr.length; i++) {
			
			    pdto.setOrder_date(pdto.getOrder_date());
	            pdto.setOrder_no(orderNo);
	            System.out.println("for문안에"+orderNo);
	            
	    		pdto.setNo(Integer.parseInt(noarr[i]));
	    		pdto.setImg(imgarr[i]);
	    		pdto.setName(namearr[i]);   	
	    		pdto.setCnt(Integer.parseInt(cntarr[i]));
	    		pdto.setPrice(Integer.parseInt(pricearr[i]));
	    		pdto.setTotal(Integer.parseInt(cntarr[i])*Integer.parseInt(pricearr[i]));
	    		pdto.setId(loginId);
	    	
	    		arr.add(pdto);
	        	jdao.insertProduct(pdto);
		}
		
		// order_address 테이블에 insert
		bdto.setOrder_date(pdto.getOrder_date()) ;
    	bdto.setOrder_no(pdto.getOrder_no());
    	bdto.setBuy_name(request.getParameter("buy_name"));
    	bdto.setBuy_phone(phone01+"-"+phone02+"-"+phone03);
    	bdto.setBuy_email(request.getParameter("email"));
    	bdto.setBuy_postcode(Integer.parseInt(request.getParameter("postcode")));
    	bdto.setBuy_roadaddress(request.getParameter("roadAddress")+" "+ detailAddress);
    	bdto.setId(loginId);
    	jdao.insertBuy(bdto);
    	
    	//  구매정보에 담긴 상품을 장바구니에서 삭제한다.
        for(int i=0;i<noarr.length;i++) {       	
         	jdao.deleteJang(Integer.parseInt(noarr[i]));
     	}
        
         request.setAttribute("Or_date", bdto.getOrder_date());
         request.setAttribute("Or_no", bdto.getOrder_no());
         
         RequestDispatcher rdis =  request.getRequestDispatcher("RentcarMain.jsp?section=ToOrderList.jsp");
         rdis.forward(request, response);
 	}
		
}
