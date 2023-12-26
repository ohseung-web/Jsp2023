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


@WebServlet("/RentDeletePro.do")
public class RentDelete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
     protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	 request.setCharacterEncoding("UTF-8");
    	 
    	 JangDAO jdao = new JangDAO();
         JangDTO jdto = new JangDTO();
    	
    	String [] arrchk = request.getParameterValues("chk");
    	
    	/*RequestDispatcher  dis = request.getRequestDispatcher("JangMsg.jsp");
   	    dis.forward(request, response);*/
    	
    	for(int i=0; i<arrchk.length;i++) {
    		jdao.deleteJang(Integer.parseInt(arrchk[i]));
    		System.out.println("chk:"+Integer.parseInt(arrchk[i]));
    	}
 
    	 //select ��� ���� �迭�� ��� ������� ���� �ش�.
		   ArrayList<JangDTO>  a = jdao.getAllJang();
						
			//�����͸� jsp������ ���Ѱ� �ش�. ��, �����͸� ������ ����.
			//ArrayList�� jsp������ �Ѱ� ��
			request.setAttribute("a", a);
    	 
    	 RequestDispatcher  dis1= request.getRequestDispatcher("JangList.jsp");
    	 dis1.forward(request, response);
    	 
	}
           
	
}
