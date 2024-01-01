package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ScoreDTO;
import model.scoreDAO;

@WebServlet("/scoreInfo.do")
public class scoreInfoProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 scoreDAO sdao = new scoreDAO();
		    
		    HttpSession session = request.getSession();
		    session.setAttribute("num", request.getParameter("num"));
		    
		    String num = (String)session.getAttribute("num");
		      
		   /* String id = request.getParameter("id");*/
		    //MemberDTO 타입으로 개인 정보 리턴
		    ScoreDTO sdto = sdao.getOneScore(num);
		    request.setAttribute("num", sdto.getNum());
		    request.setAttribute("name", sdto.getName());
		    request.setAttribute("sub1", sdto.getSub1());
		    request.setAttribute("sub2", sdto.getSub2());
		    request.setAttribute("sub3", sdto.getSub3());
		    request.setAttribute("total", sdto.getTotal());
		    request.setAttribute("average", sdto.getAverage());
		    request.setAttribute("grade", sdto.getGrade());
		     
		    
		    RequestDispatcher dis = request.getRequestDispatcher("scoreInfo.jsp");
		    dis.forward(request, response);
	}
}
