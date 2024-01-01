package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.ScoreDTO;
import model.scoreDAO;

@WebServlet("/score.do")
public class scorePro extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	 protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 request.setCharacterEncoding("UTF-8");
		 
		// 서블릿에서 넘어온 사용자 정보 getParameter 값을 DTO에 담아서 떠 넘겨주는 코딩
		
    
		 ScoreDTO  sdto = new ScoreDTO();
		 
		 
		 sdto.setNum(request.getParameter("num"));
		 sdto.setName(request.getParameter("name"));	 
		 int score1 = Integer.parseInt(request.getParameter("sub1"));
		 int score2 = Integer.parseInt(request.getParameter("sub2"));
		 int score3 = Integer.parseInt(request.getParameter("sub3"));
		 
		 if((score1>=0 && score1<=100) || (score2>=0 && score2<=100) || (score3>=0 && score3<=100) ) {
			 
			
			 sdto.setSub1(score1);
			 sdto.setSub2(score2);
			 sdto.setSub3(score3);
			 
			 int total = score1 + score2 + score3;
			 sdto.setTotal(total);
			 
			 
			 double avg = total/3;
			 sdto.setAverage(avg);
			 
			 String grad = null;
			 
			 if(avg >= 90) {
				 grad ="A";	
			 }else if(avg >= 80) {
				 grad = "B";
			 }else if(avg >= 70) {
				 grad = "C";
			 }else if(avg >= 60) {
				 grad = "D";	 
			 }else {
				 grad = "F";
			 }
			 		
			sdto.setGrade(grad);
			 //--------------------------------------------------------------
			 scoreDAO sdao = new scoreDAO();
			 sdao.insertMember(sdto);
			  		 
			 RequestDispatcher dis = request.getRequestDispatcher("scoreListProc.do");
			 dis.forward(request, response);
			 
			 
		 }else {
			 
			 RequestDispatcher dis = request.getRequestDispatcher("scoreError.jsp");
			 dis.forward(request, response);
		 }
		 
	
		 
	}
}















