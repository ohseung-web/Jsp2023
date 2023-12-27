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
    	
    	// JangList.jsp에서 chk박스는 동시에 여러개를 선택할 수 있기때문에
    	// request.getParameterValues( )를 이용하여 값을 받아온다.
    	
    	JangDAO jdao = new JangDAO();
    	JangDTO jdto = new JangDTO();
    	
		 String chk = request.getParameter("chk"); 
    	
    	String [] arrChk = chk.split(" ");
    	/// chk박스의 값이 value="${jdto.no}"인 숫자로 되어있기때문에 반드시 Integer.parseInt()로 형변환 한다.
    	for(int i=0; i<arrChk.length; i++) {
    		jdao.deletejang(Integer.parseInt(arrChk[i]));
    	}
    	
    	// 데이터 삭제한 후 장바구니 목록을 확인할 수 있도록 배열에 담아 넘긴다.
    	ArrayList<JangDTO> jalist = jdao.getAllJang();
    	request.setAttribute("jalist", jalist);
    	
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=JangList.jsp");
    	rdis.forward(request, response);
    	
	}

}
