package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaulDAO;
import model.PaulDTO;

@WebServlet("/JoinProc.do")
public class JoinProc extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		PaulDTO pdto = new PaulDTO();
		pdto.setU_id(request.getParameter("u_id"));
		pdto.setU_pw(request.getParameter("u_pw"));
		pdto.setU_pwchk(request.getParameter("u_pwchk"));
		pdto.setU_name(request.getParameter("u_name"));
		pdto.setU_email(request.getParameter("u_email"));
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		pdto.setU_tel(tel1 + "-" + tel2 + "-" + tel3);
		pdto.setU_question(request.getParameter("u_question"));
		pdto.setU_answer(request.getParameter("u_answer"));
		pdto.setU_zipcode(request.getParameter("u_zipcode"));
		pdto.setU_roadaddr(request.getParameter("u_roadAddr"));
		pdto.setU_detailaddr(request.getParameter("u_detailAddr"));
		pdto.setU_extraaddr(request.getParameter("u_extraAddr"));
		
		PaulDAO pdao = new PaulDAO();
		
		//회원중복 체크
		String notjoin = pdao.existUser(pdto.getU_id());
		if(notjoin.equals("사용할 수 없는 아이디입니다.")) {
			notjoin = "아이디 중복확인을 해주세요! 사용할 수 없는 아이디입니다.";
			request.setAttribute("notjoin", notjoin);
			
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Join.jsp");
			dis.forward(request, response);
		}else {
			pdao.insertUser(pdto);
			
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Login.jsp");
			dis.forward(request, response);
		}

	}
}
