package controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Mmap;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/proc.do")
public class MemberJoinProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		String id = request.getParameter("id");
		mdto.setId(id);
		String chkid = mdao.getId(id);
		
		String pw = request.getParameter("pw");
		String pwchk = request.getParameter("pwchk");
		
		mdto.setPw(pw);
		mdto.setPwchk(pwchk);
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		
		String [] arr = request.getParameterValues("hobby");
		String data ="";
		for(String string : arr) {
			data += string + ""; //하나의 스트링으로 데이터 연결
		}
		mdto.setHobby(data);
		
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));
		
		//패스워드 같을 경우에만 데이터 베이스에 저장한다.
		if(id.equals(chkid)) {
			request.setAttribute("msgid", "이미 존재하는 아이디 입니다.");
			RequestDispatcher rdis = request.getRequestDispatcher("LoginIdError.jsp");
			rdis.forward(request, response);
			
		}else if(pw.equals(pwchk)) {
			
			mdao.insertMember(mdto);
			//컨트롤러에서 또 다른 컨트롤러를 호출해주어야 한다.
			//MemberListCon.java servlet를 생성하고 MemberListCon.do를 호출한다. 
			RequestDispatcher rdis = request.getRequestDispatcher("MemberListCon.do");
			rdis.forward(request, response);
			
		}else {
			request.setAttribute("msg", "패스워드가 일치하지 않습니다.");
			RequestDispatcher rdis = request.getRequestDispatcher("LoginError.jsp");
			rdis.forward(request, response);
		}
		

	}
}
