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

@WebServlet("/FindpwProc.do")
public class FindpwProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String u_id = request.getParameter("u_id");
		request.getParameter("u_question");
		request.getParameter("u_answer");
		
		PaulDAO pdao = new PaulDAO();
		
		//입력한 아이디가 존재하는가?
		String existuser = pdao.existUser(u_id);
		if(existuser != null && !existuser.isEmpty()) { //아이디가 존재함.
			PaulDTO pdto = pdao.findpw(u_id);
			
			// 회원이 선택한 '비밀번호 찾기 질문'과 db에 등록된 질문과 같은가?
			if(pdto.getU_question().equals(request.getParameter("u_question"))) {
				// 회원이 선택한 '비밀번호 찾기 답변'과 db에 등록된 답변과 같은가?
				if(pdto.getU_answer().equals(request.getParameter("u_answer"))) {
					request.setAttribute("findid", u_id + " 님의 비밀번호는 <br>");
					request.setAttribute("findpw", pdto.getU_pw()+" 입니다.");
				}else {
					request.setAttribute("nott", "Not ");
					request.setAttribute("findid", u_id + "님");
					request.setAttribute("findpw", "입력한 정보가 알맞지 않으므로 비밀번호를 찾을 수 없습니다.");
				}
			}else {
				request.setAttribute("nott", "Not ");
				request.setAttribute("findid", u_id + " 님");
				request.setAttribute("findpw", "입력한 정보가 알맞지 않으므로 비밀번호를 찾을 수 없습니다.");
			}
		}else {
			request.setAttribute("nott", "Not ");
			request.setAttribute("findid", u_id + " 는");
			request.setAttribute("findpw", "존재하지 않는 회원입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Findpw.jsp");
		dis.forward(request, response);
	}

}
