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

@WebServlet("/OrderList.do")
public class OrderList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			request.setAttribute("loginessential", "�α��� �� �̿� �����մϴ�.");
			
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
			
		}else {
			TeteumDAO tdao = new TeteumDAO();
			TeteumDTO tdto = new TeteumDTO();
			
			ArrayList<TeteumDTO> al = new ArrayList<>();
			
			String chkno = request.getParameter("chkno");
			
			if(chkno == null) {
				
				request.setAttribute("orderfail", "�ֹ��� ��ǰ�� �������ּ���.");
				
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
			}else {
				String no[] = request.getParameterValues("chkno");
				
				String nochk = "";
				int totalprice = 0;
				int total = 0;
				
				for(int i = 0; i < no.length; i++) {
					nochk = no[i];
					tdto =  tdao.buySelect(nochk);
					totalprice += tdto.getC_price();
					al.add(tdto); // �� �྿ �߰��ϴ� �ڵ�
				}
				
				request.setAttribute("al", al);
				
				total = totalprice;
				
				request.setAttribute("sum_price", total);
				
				tdto = tdao.getMemberInfo(id);
				
				request.setAttribute("id", tdto.getId());
				request.setAttribute("email", tdto.getEmail());
				request.setAttribute("name", tdto.getName());
				request.setAttribute("password", tdto.getPassword());
				request.setAttribute("phone", tdto.getPhone());
				request.setAttribute("zipcode", tdto.getZipcode());
				request.setAttribute("roadaddress", tdto.getRoadaddress());
				request.setAttribute("agreeterms", tdto.getAgree_terms());
				request.setAttribute("agreeage", tdto.getAgree_age());
				request.setAttribute("agreeemail", tdto.getAgree_email());
				request.setAttribute("detailaddress", tdto.getDetailaddress());
				request.setAttribute("agreemessage", tdto.getAgree_message());
				
				RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=OrderList.jsp");
				dis.forward(request, response);
			}
			
		}
		
	}

}
