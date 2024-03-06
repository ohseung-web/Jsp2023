package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;
import model.MemberDTO;

@WebServlet("/MemberFindPwqProc.do")
public class MemberFindPwqProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = new MemberDTO();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwq = request.getParameter("pwq");
		String pwa = request.getParameter("pwa");
		String name = request.getParameter("name");
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		String defaultaddr = request.getParameter("defaultaddr");
		String detailaddr = request.getParameter("detailaddr");
		String phone = request.getParameter("phone");
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
		
		String inputPwa = request.getParameter("inputPwa");
		
		if(!inputPwa.equals(pwa)) {
			request.setAttribute("msgPwq", "질문에 대한 답변이 올바르지 않습니다.");
			request.setAttribute("mdto", mdto);
			RequestDispatcher rd = request.getRequestDispatcher("MemberFindPwError.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("mdto", mdto);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=MemberFindPwResult.jsp");
			rd.forward(request, response);
		}
	}
}
