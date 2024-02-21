package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDTO;
import model.LivingDAO;
import model.MemberDTO;
import model.ProductDTO;

@WebServlet("/CartOrderPro.do")
public class CartOrderPro extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		CartDTO cdto = new CartDTO();
		MemberDTO mdto = new MemberDTO();
		ProductDTO pdto = new ProductDTO();
		ArrayList<CartDTO> chkList = new ArrayList<>(); 
		
		String loginId = request.getParameter("loginId");
		String chk = request.getParameter("chk");
		String chkArr[] = chk.split(" ");
		
		// 상품 상세리스트에서 바로 구매할 떄 넘어온 데이터
		// indexOf는 chk의 공백이 존재하지 않으면 -1로 출력. 존재하면 존재하는 위치를 숫자로 출력함
		int chkbool = chk.indexOf(" "); 
	      
    	String cnt = request.getParameter("cnt"); //상품 상세리스트에서 넘어온 수량
		int quanty = 0;
		
		if(cnt != null) {
			quanty = Integer.parseInt(cnt);
		}
		
         if(chk != null && !chk.isEmpty()) {
    		
    		if(chkbool == -1) { // 상품 상세리스트에서 바로구매 한경우
        		int chkno = Integer.parseInt(chk);
        		
        		//장바구니가 아니라 상품테이블에서 상품을 select 하여야 한다.
        		pdto = ldao.buyProductselect(chkno);
        		
        		request.setAttribute("cnt", quanty);
        		request.setAttribute("pdto", pdto);
        		
        	}else {
        		
        		for(int i=0;i<chkArr.length;i++) {
        			int check = Integer.parseInt(chkArr[i]);
        			cdto = ldao.getCartSelect(check);
        			chkList.add(cdto);
        		}
        		request.setAttribute("chkList", chkList);
        	}
		
         }	

		// 로그인된 id의 개인 한사람의 정보를 출력 select하여 저장
		mdto = ldao.getOneMember(loginId);
		
		request.setAttribute("mdto", mdto);
		RequestDispatcher rd = request.getRequestDispatcher("CartOrder.jsp");
		rd.forward(request, response);
	}	
}