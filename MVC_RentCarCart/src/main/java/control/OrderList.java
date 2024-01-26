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


@WebServlet("/OrderListPro.do")
public class OrderList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    reqPro(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	
    	JangDAO jdao = new JangDAO();
    	JangDTO jdto = new JangDTO();
    	//BuyDTO bdto = new BuyDTO();
    	ArrayList<JangDTO> ac = new ArrayList<>();
    	
	    String loginId = request.getParameter("loginId"); 
    	String chk = request.getParameter("chk");
    	String [] arrChk = chk.split(" ");
    	int aChk = 0;
        
    	// 장바구니에서 선택한 상품이 있을때만 구매해야 하므로 null처리한다.
    	if(chk != null && !chk.isEmpty()) {
    		
    		for(int i=0; i<arrChk.length; i++) {
    			aChk = Integer.parseInt(arrChk[i]);
    			jdto = jdao.buyselect(aChk);
    			ac.add(jdto);
    		}
    		
    	}else { // 선택된 상품이 없을 떄 예외처리
    		request.setAttribute("msgchk", "상품을 선택하세요");
    		RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
    	    rdis.forward(request, response);
    	}
    	
    	// 상품을 이미 구매한 회원인 경우 자동으로 주소 출력하는 코드
    	BuyDTO bdto = new BuyDTO();
    	// 한 사람의 구매주소 정보를 저장
    	bdto = jdao.getOneBuy(loginId);
    	
    	// 로그인된 id와 order_address테이블의 id가 같으면 이미 상품을 구매한 적이 있기때문에
    	// BuyDTO에 존재하는 phone, roadaddress를 문자 자르기 함수를 이용하여 잘라 보낸다.
    	if(loginId.equals(bdto.getId())) {
    		
    		     // substring(a, b) : a부터 b전까지 문자 자르기
    		       String phone02 = bdto.getBuy_phone().substring(4, 8);
                   String phone03 = bdto.getBuy_phone().substring(9, 13);
        	
               // indexOf("a") : 문자 a가 위치하는 index번호를 숫자로 변환하여 출력
        	    int stringNum = bdto.getBuy_roadaddress().indexOf("   "); 
    		    String roadaddr = bdto.getBuy_roadaddress().substring(0, stringNum); 
    		    
    		    // substring(5) : 5번째위치 부터 그 뒤로 모두 자르기
    		    String detailaddr = bdto.getBuy_roadaddress().substring(stringNum+3);
    		    
    		    request.setAttribute("bdto", bdto);
        	    request.setAttribute("phone02", phone02);
        	    request.setAttribute("phone03", phone03);
    		    request.setAttribute("roadaddr", roadaddr);
    	      	request.setAttribute("detailaddr", detailaddr);

    	}
    
        	//select한 결과를 저장
        	request.setAttribute("ac", ac);

    	    RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=OrderList.jsp");
    	    rdis.forward(request, response);
    	
	}
 
}
