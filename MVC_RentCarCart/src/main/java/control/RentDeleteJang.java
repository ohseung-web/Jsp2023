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

import model.JangDAO;
import model.JangDTO;

@WebServlet("/RentDeleteJang.do")
public class RentDeleteJang extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	String loginId = request.getParameter("loginId"); 
    	
    	if(loginId == "") {
    		loginId = "geust";
    	}
    	
    	// JangList.jsp에서 chk박스는 동시에 여러개를 선택할 수 있기때문에
    	// request.getParameterValues( )를 이용하여 값을 받아온다.
    	
    	JangDAO jdao = new JangDAO();
    	JangDTO jdto = new JangDTO();
    	
		 String chk = request.getParameter("chk"); 
    	
    	String [] arrChk = chk.split(" ");
    	
    	if(chk != null && !chk.isEmpty()) {
    		/// chk박스의 값이 value="${jdto.no}"인 숫자로 되어있기때문에 반드시 Integer.parseInt()로 형변환 한다.
        	for(int i=0; i<arrChk.length; i++) {
        		jdao.deletejang(Integer.parseInt(arrChk[i]));
        	}
    	}else {
    		request.setAttribute("msgDelete", "삭제할 상품을 선택하세요");
    		RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
    		rdis.forward(request, response);
    	}
    	
    	//--------------------------------------------------------------
    	// rentjang 테이블에 상품을 삭제하고 난 후 전체 개수를 세어서 세션에 담아 JangList.jsp 떠넘긴다.
    	 int rentJangCount = jdao.rentjangCount(loginId);
    	 HttpSession session = request.getSession();
    	 
    	 if(rentJangCount == 0) {
    		 session.invalidate();
    	 }else {
    		 session.setAttribute("rentCount", rentJangCount);
        	 // 세션시간 무한대로 설정
        	 session.setMaxInactiveInterval(-1);
    	 }
       //------------------------------------------------------------
    	  
    	// 데이터 삭제한 후 장바구니 목록을 확인할 수 있도록 배열에 담아 넘긴다.
    	ArrayList<JangDTO> jalist = jdao.getAllJang(loginId);
    	request.setAttribute("jalist", jalist);
    	
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=JangList.jsp");
    	rdis.forward(request, response);
	}

}
