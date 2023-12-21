package controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;

import model.MemberDTO;


@WebServlet("/Mproc.do")
public class MemberJoinMVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO  mdto = new MemberDTO();
		mdto.setId(request.getParameter("id"));
		mdto.setPw(request.getParameter("pw"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setAddress(request.getParameter("address"));
		
		//request객체에 DTO클래스를 추가
		request.setAttribute("mdto", mdto);
		
		RequestDispatcher rdis = request.getRequestDispatcher("MemberView.jsp");
		rdis.forward(request, response);
		
	}
}



