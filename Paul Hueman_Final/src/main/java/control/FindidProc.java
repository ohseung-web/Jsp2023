package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaulDAO;
import model.PaulDTO;

@WebServlet("/FindidProc.do")
public class FindidProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String u_tel = request.getParameter("u_tel");
		String u_email = request.getParameter("u_email");
		
		//휴대폰번호와 이메일을 받아왔을 때
		if((u_tel != null && !u_tel.isEmpty()) && (u_email != null && !u_email.isEmpty())) {
			
			PaulDAO pdao = new PaulDAO();
			ArrayList<PaulDTO> findid_list = new ArrayList<PaulDTO>();
			findid_list = pdao.findid(u_tel, u_email);
			//findid_list 갯수가 1개 이상이면 아이디 존재
			if(findid_list.size()>0) {
				request.setAttribute("findid_list", findid_list);
				request.setAttribute("first", "찾은 아이디는 ");
				request.setAttribute("end", "입니다.");
				
			}else {//동일한 휴대폰번호와 이메일을 가진 회원이 존재하지 않음
				request.setAttribute("nott", "Not ");
				request.setAttribute("findpw", "존재하지 않는 회원입니다.");
			}
			
		}else { //입력값을 받아오지 못했을 때
			request.setAttribute("null_tel_email", "휴대폰번호와 이메일을 입력해주세요!");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Findid.jsp");
		dis.forward(request, response);
		
	}

}
