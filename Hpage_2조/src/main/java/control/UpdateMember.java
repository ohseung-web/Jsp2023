package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/UpdateMember.do")
public class UpdateMember extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String sid = (String)session.getAttribute("id");
		
		if(sid == null) {
			request.setAttribute("msg", "로그인 후 이용 가능합니다.");
			
			RequestDispatcher dis = request.getRequestDispatcher("OrderFail.jsp");
			dis.forward(request, response);
			
		}else {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String phone = tel1 + "-" + tel2 + "-" + tel3;
			String zipcode = request.getParameter("zipcode");
			String roadaddress = request.getParameter("address1");
			String detailaddress = request.getParameter("address2");
			String checkemail = request.getParameter("checkemail");
			String checkmessage = request.getParameter("checkmessage");
			String agreeemail = "";
			String agreemessage = "";
			
			if(checkemail == null && checkmessage == null) {
				agreeemail = "";
				agreemessage = "";
			}else if(checkemail == null && checkmessage != null) {
				agreeemail = "";
				agreemessage = "동의";
			}else if(checkemail != null && checkmessage == null) {
				agreeemail = "동의";
				agreemessage = "";
			}else {
				agreeemail = "동의";
				agreemessage = "동의";
			}
			
			TeteumDAO tdao = new TeteumDAO();
			TeteumDTO tdto = new TeteumDTO();
			
			tdto.setId(id);
			tdto.setEmail(email);
			tdto.setPhone(phone);
			tdto.setZipcode(zipcode);
			tdto.setRoadaddress(roadaddress);
			tdto.setAgree_email(agreeemail);
			tdto.setAgree_message(agreemessage);
			tdto.setDetailaddress(detailaddress);
			
			tdao.updateMember(tdto);
			
			ArrayList<TeteumDTO> al = tdao.getBoard(id);
			
			request.setAttribute("al", al);
			
			ArrayList<TeteumDTO> arl = tdao.getBuyProduct(id);
			
			request.setAttribute("arl", arl);
			
			request.setAttribute("infochangesuccess", "회원정보가 변경되었습니다.");
			
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
		}
	}

}
