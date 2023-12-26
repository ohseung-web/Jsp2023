package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.JangDAO;
import Model.JangDTO;
import Model.RentDAO;
import Model.RentDTO;


@WebServlet("/Jang.do")
public class JangPro extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 reqPro(request, response);
	}

	private void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
         request.setCharacterEncoding("UTF-8");
		
         /*System.out.println("no:"+Integer.parseInt(request.getParameter("no")));*/
        
         JangDTO jdto = new JangDTO();
         JangDAO  jdao = new JangDAO();	
       
         if( request.getParameter("no") != null ) {
        	 
        	 jdto.setNo(Integer.parseInt(request.getParameter("no")));
             jdto.setImg(request.getParameter("img"));
             jdto.setName(request.getParameter("name"));
             jdto.setCnt(Integer.parseInt(request.getParameter("cnt")));
             jdto.setPrice(Integer.parseInt(request.getParameter("price")));
             
             int no = Integer.parseInt(request.getParameter("no"));
             int cnt = Integer.parseInt(request.getParameter("cnt"));
             
             int count = jdao.getSel(no);
             
             // select 문을 이용하여 번호에 해당하는 개수를 누적 
             // 개수가 0이면 insert 하고
             // 아니면 update 해라
            if(count == 0) {
            	jdao.inserJang(jdto);
             }else {
            	 jdao.updateJang(cnt,no);
             }
         }
  
		  // insert 하고 난 후 select 하여 값을 확인한다.
		  //select 결과 값을 배열로 담아 목록으로 보여 준다.
			ArrayList<JangDTO>  a = jdao.getAllJang();
						
			//데이터를 jsp쪽으로 떠넘겨 준다. 단, 데이터를 가지고 간다.
			//ArrayList를 jsp쪽으로 넘겨 줌
			request.setAttribute("a", a);
		
		RequestDispatcher dis = request.getRequestDispatcher("JangList.jsp");
		dis.forward(request, response);
			
		}
}
