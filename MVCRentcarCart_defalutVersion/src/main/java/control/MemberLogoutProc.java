package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberLogoutProc.do")
public class MemberLogoutProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
   protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   request.setCharacterEncoding("UTF-8");
	   
       // -. 세션의 유효 시간은 기본적으로 30분으로 잡혀 있다. 
	   // -. 세션이 더 이상 사용되지 않는다면 세션 정보도 더 이상 필요하지 않는다. 
	   // -. 이때 설정된 세션의 값들을 모두 사라지도록 하기 위해서는 세션 객체의 invalidate 함수를 사용한다. 
	   // -. invalidate 함수는 세션을 없애고 세션에 속해있는 값들을 모두 없앤다.

	   HttpSession session = request.getSession();
	   session.invalidate();
	   
	   RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp");
	   rdis.forward(request, response);
	}

}


