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


@WebServlet("/BoardReWriterProcCon.do")
public class BoardReWriterProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	request.setCharacterEncoding("UTF-8");
    	
    	//BoardDTO에 넘어온 데이터를 저장 
    	BoardDTO bdto = new BoardDTO();
    	bdto.setWriter(request.getParameter("writer"));
    	bdto.setSubject(request.getParameter("subject"));
    	bdto.setEmail(request.getParameter("email"));
    	bdto.setPassword(request.getParameter("password"));
    	bdto.setContent(request.getParameter("content"));
    	
    	bdto.setRef(Integer.parseInt(request.getParameter("ref")));
    	bdto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
    	bdto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
    	
    	BoardDAO bdao = new BoardDAO();
    	bdao.reInsertBoard(bdto);
    	
    	RequestDispatcher rdis = request.getRequestDispatcher("BoardListCon.do");
    	rdis.forward(request, response);
	   
	}

}
