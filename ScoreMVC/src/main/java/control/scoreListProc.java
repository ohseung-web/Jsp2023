package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ScoreDTO;
import model.scoreDAO;


@WebServlet("/scoreListProc.do")
public class scoreListProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}

	  protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//데이터베이스 연결하여 회원의 모든 정보를 리턴한다.
		  scoreDAO sdao = new scoreDAO();
		  ArrayList<ScoreDTO> a = sdao.getAllStudent();
		
			//데이터를 jsp쪽으로 떠넘겨 준다. 단, 데이터를 가지고 간다.
			//ArrayList를 jsp쪽으로 넘겨 줌
			request.setAttribute("a", a);
			
			RequestDispatcher dis = request.getRequestDispatcher("scoreList.jsp");
			dis.forward(request, response);
	}
}
