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

@WebServlet("/RentUpdate.do")
public class RentUpdate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
   
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JangDAO jdao = new JangDAO();
		JangDTO jdto = new JangDTO();
	
		int no = Integer.parseInt(request.getParameter("no"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		String loginId = request.getParameter("loginId"); 
		
//		System.out.println("장바구니에서 넘어온 id"+loginId);
		
//		jangList.jsp에서 수정시 로그인id가 공백이면 geust로 id 저장한다.
		if(loginId == "") {
			loginId = "geust";
		}
		
//		System.out.println("geust를 담은 id"+loginId);
		
		jdao.updatecount(cnt, no, loginId);
		
		ArrayList<JangDTO> jalist = jdao.getAllJang(loginId);
		request.setAttribute("jalist", jalist);
		
		RequestDispatcher rdis =  request.getRequestDispatcher("RentcarMain.jsp?section=JangList.jsp");
		rdis.forward(request, response);
	}

}

