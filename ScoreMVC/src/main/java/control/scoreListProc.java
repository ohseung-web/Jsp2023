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
		
		//�����ͺ��̽� �����Ͽ� ȸ���� ��� ������ �����Ѵ�.
		  scoreDAO sdao = new scoreDAO();
		  ArrayList<ScoreDTO> a = sdao.getAllStudent();
		
			//�����͸� jsp������ ���Ѱ� �ش�. ��, �����͸� ������ ����.
			//ArrayList�� jsp������ �Ѱ� ��
			request.setAttribute("a", a);
			
			RequestDispatcher dis = request.getRequestDispatcher("scoreList.jsp");
			dis.forward(request, response);
	}
}
