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


@WebServlet("/BoardUpdateCon.do")
public class BoardUpdateCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	//해당 번호를읽어 들인다.
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    	//데이터 베이스에서 하나의 게시글에 대한 정보를 리턴메소드 호출
    	BoardDAO bdao = new BoardDAO();
    	BoardDTO bdto = bdao.getOneUpdateBoard(num);
    	
    	request.setAttribute("bdto", bdto);
    	RequestDispatcher rdis = request.getRequestDispatcher("BoardUpdateForm.jsp");
    	rdis.forward(request, response);
    	
    	
	}

}
