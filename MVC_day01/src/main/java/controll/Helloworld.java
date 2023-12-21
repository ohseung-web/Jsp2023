package controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Helloworld") //어노테이션 매핑
public class Helloworld extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	//일괄처리, doGet, doPost 아래 reqPro메소드가 실행되게 해줌
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//jsp 쪽으로 떠넘겨질 데이터를 입력
		String msg = "Hello World~~ 안녕하세요";
		
		//jsp쪽으로 데이터를 request.setAttribue에 담아서 넘겨준다.
		request.setAttribute("msg", msg);
		
		//서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체 선언
		RequestDispatcher redis = request.getRequestDispatcher("Helloworld.jsp");
		redis.forward(request, response);
		
	}
}
