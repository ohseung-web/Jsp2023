package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LivingDAO;
import model.MemberDTO;

@WebServlet("/MemberModifyProc.do")
public class MemberModifyProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loginId = request.getParameter("loginId");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = new MemberDTO();
		
		// id 중복체크
		String id = request.getParameter("id");
		String checkId = ldao.getOneId(id);
					
		// pw 확인
		String pw = request.getParameter("pw");
		String checkPw = request.getParameter("pwchk");
					
		String pwq = request.getParameter("pwq");
		String pwa = request.getParameter("pwa");
		String name = request.getParameter("name");
		int postcode =  Integer.parseInt(request.getParameter("postcode"));
		String defaultaddr = request.getParameter("defaultaddr");
		String detailaddr = request.getParameter("detailaddr");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1+"-"+phone2+"-"+phone3;
		String email = request.getParameter("email");
					
		mdto.setM_id(id);
		mdto.setM_pw(pw);
		mdto.setM_pwq(pwq);
		mdto.setM_pwa(pwa);
		mdto.setM_name(name);
		mdto.setM_postcode(postcode);
		mdto.setM_defaultaddr(defaultaddr);
		mdto.setM_detailaddr(detailaddr);
		mdto.setM_phone(phone);
		mdto.setM_email(email);		
		
		/*
		if(id.equals(checkId)) { // 아이디 중복
			request.setAttribute("msg", "0");
			RequestDispatcher rd = request.getRequestDispatcher("MemberModify.do");
			rd.forward(request, response);
		}
		else { // 회원가입 성공
			request.setAttribute("msg", "1");
			ldao.updateMember(mdto);
			RequestDispatcher rd = request.getRequestDispatcher("MemberModify.do");
			rd.forward(request, response);
		}
		*/
		
		request.setAttribute("msg", "1");
		ldao.updateMember(mdto);
		RequestDispatcher rd = request.getRequestDispatcher("MemberModify.do");
		rd.forward(request, response);
	}

}
