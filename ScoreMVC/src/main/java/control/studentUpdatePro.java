package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.scoreDAO;



@WebServlet("/studentUpdate.do")
public class studentUpdatePro extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  reqPro(request, response);
	}
	
    private void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
		 
		//데이터베이스 연결
		    scoreDAO sdao = new scoreDAO();
	
		    HttpSession session = request.getSession();
			session.setAttribute("num", request.getParameter("num"));
	       
			String num = (String) session.getAttribute("num");
		         
	        // 해당 게시글의 학번 값을 읽어옴 , updateform에서의 패스워드임
			
			int sub1 = Integer.parseInt(request.getParameter("sub1"));
			int sub2 = Integer.parseInt(request.getParameter("sub2"));
			int sub3 = Integer.parseInt(request.getParameter("sub3"));
			
			  sdao.updateScore(num, sub1, sub2, sub3); 
			  RequestDispatcher dis = request.getRequestDispatcher("msg.jsp");
	    	  dis.forward(request, response);
			
			/*String name = request.getParameter("name");
	        String  name2 = sdao.getNum(num);
	     
			if((sub1>=0 && sub1<=100) || (sub2>=0 && sub2<=100) || (sub3>=0 && sub3<=100) ) {
			  
			}else {
	    	 RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
	    	 dis.forward(request, response);
			}	 */
	
    }
}
