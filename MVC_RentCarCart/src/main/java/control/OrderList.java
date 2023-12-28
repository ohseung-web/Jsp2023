package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
    	JangDAO jdao = new JangDAO();
    	JangDTO jdto = new JangDTO();
    	ArrayList<JangDTO> ac = new ArrayList<>();
    	
    	String chk = request.getParameter("chk");
    	String [] arrChk = chk.split(" ");
    	int aChk = 0;
    	
    	// 장바구니에서 선택한 상품이 있을때만 구매해야 하므로 null처리한다.
    	if(chk != null) {
    		
    		for(int i=0; i<arrChk.length; i++) {
    			aChk = Integer.parseInt(arrChk[i]);
    			jdto = jdao.buyselect(aChk);
    			ac.add(jdto);
    		}
    	}
    	
    	//select한 결과를 저장
    	request.setAttribute("ac", ac);
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=OrderList.jsp");
    	rdis.forward(request, response);
    	
	}

}
