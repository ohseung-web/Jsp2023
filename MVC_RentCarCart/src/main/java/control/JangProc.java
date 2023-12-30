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
  
//    	HttpSession session = request.getSession();
//    	String loginid = (String)session.getAttribute("rentlogin");
    	
    	// 반드시 no를 null처리 하여야 한다.
    	if(request.getParameter("no") != null) {
    		
    		// Rentinfo에서 떠 넘겨준 값을 JangDTO에 insert 하기
    		int no = Integer.parseInt(request.getParameter("no"));
    		int cnt = Integer.parseInt(request.getParameter("cnt"));
    		
        	jdto.setNo(no);
        	jdto.setImg(request.getParameter("img"));
        	jdto.setName(request.getParameter("name"));
        	jdto.setCnt(cnt);
        	jdto.setPrice(Integer.parseInt(request.getParameter("price")));
        	
        	// 장바구니에 중복으로 상품이 담기지 못하도록 rentjang테이블에 no에 해당하는 상품의 개수를 세어서 담는다.
        	int count = jdao.getNoCount(no);
        	
        	if(count == 0) {
        		// insert 
            	jdao.insertJang(jdto);
            	
        	}else {
        		// rentjang테이블에 같은 no의 상품이존재 하기때문에 수량만 업데이트한다.
        		jdao.updateNoCount(cnt, no);
        	}
    	}
    	
    	 // insert 하고 난 후 select 하여 값을 확인한다.
    	// 값을 배열로 담아 장바구니 목록으로 리턴한다.
    	ArrayList<JangDTO> jalist = jdao.getAllJang();
    	request.setAttribute("jalist", jalist);
//    	request.setAttribute("loginid", loginid);
    	
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=JangList.jsp");
    	rdis.forward(request, response);
	}

}
