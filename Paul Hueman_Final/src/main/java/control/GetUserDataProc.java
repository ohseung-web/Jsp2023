package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PaulDAO;
import model.PaulDTO;

@WebServlet("/GetUserData.do")
public class GetUserDataProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String paul_login = (String)session.getAttribute("paul_login");
		
		//�α��� ������ ��� -> ȸ������ Ȯ�� ����
		if(paul_login != null && !paul_login.isEmpty()) { // �α��� ����
			PaulDAO pdao = new PaulDAO();
			PaulDTO pdto = pdao.getUserData(paul_login);

			request.setAttribute("u_pw", pdto.getU_pw());
			request.setAttribute("u_name", pdto.getU_name());
			request.setAttribute("u_email", pdto.getU_email());
			request.setAttribute("u_question", pdto.getU_question());
			request.setAttribute("u_answer", pdto.getU_answer());
			request.setAttribute("u_zipcode", pdto.getU_zipcode());
			request.setAttribute("u_roadAddr", pdto.getU_roadaddr());
			request.setAttribute("u_detailAddr", pdto.getU_detailaddr());
			request.setAttribute("u_extraAddr", pdto.getU_extraaddr());

			//�޴���ȭ��ȣ "-" �������� tel1, tel2, tel3 �� ���� ����
			int idx1 = pdto.getU_tel().indexOf("-");
			int idx2 = pdto.getU_tel().lastIndexOf("-");
			
			String tel1 = pdto.getU_tel().substring(0, idx1);
			String tel2 = pdto.getU_tel().substring(idx1+1,idx2);
			String tel3 = pdto.getU_tel().substring(idx2+1);
			
			request.setAttribute("tel1", tel1);
			request.setAttribute("tel2", tel2);
			request.setAttribute("tel3", tel3);
			
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=UserModify.jsp");
			dis.forward(request, response);
			
		}else {//�α׾ƿ� ����
			request.setAttribute("LoginError", "�α��� �� �̿밡��!");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		
	}

}
