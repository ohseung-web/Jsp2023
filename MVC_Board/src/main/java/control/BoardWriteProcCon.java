package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;


@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
   protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	   request.setCharacterEncoding("UTF-8");
	  
	   // BoardDTO 데이터 읽어들인다.
	 	BoardDTO bdto = new BoardDTO();
		bdto.setWriter(request.getParameter("writer"));
		bdto.setSubject(request.getParameter("subject"));
		bdto.setEmail(request.getParameter("email"));
		bdto.setPassword(request.getParameter("password"));
		bdto.setContent(request.getParameter("content"));
		
			// BoardDAO 객체 새성
		       BoardDAO bdao = new BoardDAO();
			   bdao.insrtBoard(bdto);
			  
			//   RequestDispatcher rdis = request.getRequestDispatcher("BoardListCon.do");
			//   rdis.forward(request, response);
			   
			   response.sendRedirect("BoardListCon.do");
	}

}
