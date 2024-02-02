package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/Join.do")
public class Join extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String pwchk = request.getParameter("pwchk");
		
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		
		String zipcode = request.getParameter("zipcode");
		
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		//String address = addr1 + " " + addr2;
		
		String agree_terms = request.getParameter("agree_terms");
		String agree_age = request.getParameter("agree_age");
		String agrees = request.getParameter("agrees");
		String agree_email = "";
		String agree_message = "";
		
		if(agrees == null) {
			agree_email = "";
			agree_message = "";
		}else {
			agree_email = "����";
			agree_message = "����";
		}
		
		TeteumDTO tdto = new TeteumDTO();
		TeteumDAO tdao = new TeteumDAO();
		
		tdto.setId(id);
		tdto.setEmail(email);
		tdto.setName(name);
		tdto.setPassword(pw);
		tdto.setPhone(phone);
		tdto.setZipcode(zipcode);
		tdto.setRoadaddress(addr1);
		tdto.setDetailaddress(addr2);
		tdto.setAgree_terms(agree_terms);
		tdto.setAgree_age(agree_age);
		tdto.setAgree_email(agree_email);
		tdto.setAgree_message(agree_message);
		
		String getid = tdao.getId(id);
		
		if(!id.equals(getid)) { // �ߺ��� �ƴ϶��
			tdao.join(tdto);	
			request.setAttribute("joinsuccess", "ȸ�������� �����մϴ�!");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
			dis.forward(request, response);
		}else { // �ߺ��ΰ��
			request.setAttribute("overlapId", "�̹� �����ϴ� ���̵��Դϴ�");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
			dis.forward(request, response);
		}
		
	}

}
