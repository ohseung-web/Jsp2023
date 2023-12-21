package controll;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;


@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       //데이터 베이스에 연결하여 회원의 모든 정보를 리턴해준다.
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberDTO> alist = mdao.getAllMember();
		
	   request.setAttribute("alist", alist);//arrayList를 jsp로 넘겨준다.	
	   RequestDispatcher rdis = request.getRequestDispatcher("MemberList.jsp");
	   rdis.forward(request, response);
	}
}
