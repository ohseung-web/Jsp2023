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
		
		//�Է��� ���̵� �����ϴ°�?
		String existuser = pdao.existUser(u_id);
		if(existuser != null && !existuser.isEmpty()) { //���̵� ������.
			PaulDTO pdto = pdao.findpw(u_id);
			
			// ȸ���� ������ '��й�ȣ ã�� ����'�� db�� ��ϵ� ������ ������?
			if(pdto.getU_question().equals(request.getParameter("u_question"))) {
				// ȸ���� ������ '��й�ȣ ã�� �亯'�� db�� ��ϵ� �亯�� ������?
				if(pdto.getU_answer().equals(request.getParameter("u_answer"))) {
					request.setAttribute("findid", u_id + " ���� ��й�ȣ�� <br>");
					request.setAttribute("findpw", pdto.getU_pw()+" �Դϴ�.");
				}else {
					request.setAttribute("nott", "Not ");
					request.setAttribute("findid", u_id + "��");
					request.setAttribute("findpw", "�Է��� ������ �˸��� �����Ƿ� ��й�ȣ�� ã�� �� �����ϴ�.");
				}
			}else {
				request.setAttribute("nott", "Not ");
				request.setAttribute("findid", u_id + " ��");
				request.setAttribute("findpw", "�Է��� ������ �˸��� �����Ƿ� ��й�ȣ�� ã�� �� �����ϴ�.");
			}
		}else {
			request.setAttribute("nott", "Not ");
			request.setAttribute("findid", u_id + " ��");
			request.setAttribute("findpw", "�������� �ʴ� ȸ���Դϴ�.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Findpw.jsp");
		dis.forward(request, response);
	}

}
