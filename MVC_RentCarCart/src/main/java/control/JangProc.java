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
  
    	if(request.getParameter("no") != null) {
    		
    		// Rentinfo에서 떠 넘겨준 값을 JangDTO에 insert 하기
        	jdto.setNo(Integer.parseInt(request.getParameter("no")));
        	jdto.setImg(request.getParameter("img"));
        	jdto.setName(request.getParameter("name"));
        	jdto.setCnt(Integer.parseInt(request.getParameter("cnt")));
        	jdto.setPrice(Integer.parseInt(request.getParameter("price")));
        	
        	// JangDTO의 값을 JangDAO로 insert 하기, insert 하고 난 후 select 하여 값을 확인하고 장바구니에 담는다.
        	jdao.insertJang(jdto);
    	}
    	
    	// 값을 배열로 담아 장바구니 목록으로 리턴
    	ArrayList<JangDTO> jalist = jdao.getAllJang();
    	request.setAttribute("jalist", jalist);
    	
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=JangList.jsp");
    	rdis.forward(request, response);
	}

}
