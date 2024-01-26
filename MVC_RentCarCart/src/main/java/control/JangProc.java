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


@WebServlet("/JangProc.do")
public class JangProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	JangDTO jdto = new JangDTO();
    	JangDAO jdao = new JangDAO();
  
    	HttpSession session = request.getSession();
    	String loginID = (String)session.getAttribute("rentlogin");
    	
    	System.out.println("현재 세션에 저장된 로그인 id:" + loginID);
    	       	
    	// 반드시 no를 null처리 하여야 한다.
    	if(request.getParameter("no") != null && !request.getParameter("no").isEmpty()) {
    
        	// Rentinfo에서 떠 넘겨준 값을 JangDTO에 insert 하기
    		int no = Integer.parseInt(request.getParameter("no"));
    		int cnt = Integer.parseInt(request.getParameter("cnt"));
    	//    String loginID = request.getParameter("id");
    		
        	jdto.setNo(no);
        	jdto.setImg(request.getParameter("img"));
        	jdto.setName(request.getParameter("name"));
        	jdto.setCnt(cnt);
        	jdto.setPrice(Integer.parseInt(request.getParameter("price")));
        //	jdto.setId(loginID);
        	
        	// 비회원이 장바구니에 물건을 담을 경우 id는 geust로 저장하는 코드
        	if(loginID == null ) {
      	 	 jdto.setId("geust");
        	}else {
        		jdto.setId(loginID);
        	}
        	// 장바구니에 중복으로 상품이 담기지 못하도록 rentjang테이블에 no에 해당하는 상품의 개수를 세어서 담는다.
        	int count = jdao.getNoCount(no);
        	
        	if(count == 0) {
        		// insert 
            	jdao.insertJang(jdto);
            	
        	}else {
        		// rentjang테이블에 같은 no의 상품이존재 하기때문에 수량만 업데이트한다.
        		// 단, 같은 id인 경우만 수량을 업데이트 한다.
        		jdao.updateNoCount(cnt, no, jdto.getId());
        	}
    	}
    	
    	//--------------------------------------------------------------
    	// rentjang 테이블에 상품을 삽입하고 난후 전체 개수를 세어 세션에 담아 JangList.jsp에 떠넘긴다.
    	
    	 int rentJangCount;
    	
    	 if(loginID == null) {
    		rentJangCount = jdao.rentjangCount("geust");
    	 }else {
    		rentJangCount = jdao.rentjangCount(loginID);
    	 }
    	 session.setAttribute("rentCount", rentJangCount);
    	 // 세션시간 무한대로 설정
    	 session.setMaxInactiveInterval(-1);
    	 
    //	 HttpSession session = request.getSession();
    	 
    //	 if(rentJangCount == 0) { 이방법을 사용하면 장바구니가 비어 있을때 자동으로 로그아웃이 되기때문에~ 논리 오류 임
    //		 session.invalidate();
    //	 }else {
   // 		 session.setAttribute("rentCount", rentJangCount);
        	 // 세션시간 무한대로 설정
    //    	 session.setMaxInactiveInterval(-1);
    //	 }
    	 
    	//------------------------------------------------------------
    	 
    	 // insert 하고 난 후 select 하여 값을 확인한다.
    	// 값을 배열로 담아 장바구니 목록으로 리턴한다.
    	 System.out.println("로그인아이디"+loginID);
    	 
    	 // jdto에 id 부분에 아이디가 안들어가고 있음
    	 System.out.println("DB아이디"+jdto.getId());
    	
    	ArrayList<JangDTO> jalist = null;
    
        if(loginID == null) {
            jalist = jdao.getAllJang("geust");
        }else {
        	jalist = jdao.getAllJang(loginID);
        }
		   request.setAttribute("jalist", jalist);
    	
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=JangList.jsp");
    	rdis.forward(request, response);
	}

}
