package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.JangDAO;
import Model.JangDTO;

@WebServlet("/RentUpdate.do")
public class RentUpdate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
   
   protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	     JangDTO  jdto = new JangDTO();
         JangDAO  jdao = new JangDAO();	
     
         int no = Integer.parseInt(request.getParameter("no"));
         int cnt= Integer.parseInt(request.getParameter("cnt"));
         
         System.out.println("no:"+ no);
         System.out.println("cnt:"+cnt);
        
         jdao.updateCount(cnt, no) ;
     	
          
         //select 결과 값을 배열로 담아 목록으로 보여 준다.
		   ArrayList<JangDTO>  a = jdao.getAllJang();
						
			//데이터를 jsp쪽으로 떠넘겨 준다. 단, 데이터를 가지고 간다.
			//ArrayList를 jsp쪽으로 넘겨 줌
			request.setAttribute("a", a);
    	 
    	 RequestDispatcher  dis= request.getRequestDispatcher("JangList.jsp");
    	 dis.forward(request, response); 
	     
	}
	
}
