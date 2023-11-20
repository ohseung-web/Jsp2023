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
		
		//�޴�����ȣ�� �̸����� �޾ƿ��� ��
		if((u_tel != null && !u_tel.isEmpty()) && (u_email != null && !u_email.isEmpty())) {
			
			PaulDAO pdao = new PaulDAO();
			ArrayList<PaulDTO> findid_list = new ArrayList<PaulDTO>();
			findid_list = pdao.findid(u_tel, u_email);
			//findid_list ������ 1�� �̻��̸� ���̵� ����
			if(findid_list.size()>0) {
				request.setAttribute("findid_list", findid_list);
				request.setAttribute("first", "ã�� ���̵�� ");
				request.setAttribute("end", "�Դϴ�.");
				
			}else {//������ �޴�����ȣ�� �̸����� ���� ȸ���� �������� ����
				request.setAttribute("nott", "Not ");
				request.setAttribute("findpw", "�������� �ʴ� ȸ���Դϴ�.");
			}
			
		}else { //�Է°��� �޾ƿ��� ������ ��
			request.setAttribute("null_tel_email", "�޴�����ȣ�� �̸����� �Է����ּ���!");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Findid.jsp");
		dis.forward(request, response);
		
	}

}
