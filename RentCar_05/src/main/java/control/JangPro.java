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
             
             // select ���� �̿��Ͽ� ��ȣ�� �ش��ϴ� ������ ���� 
             // ������ 0�̸� insert �ϰ�
             // �ƴϸ� update �ض�
            if(count == 0) {
            	jdao.inserJang(jdto);
             }else {
            	 jdao.updateJang(cnt,no);
             }
         }
  
		  // insert �ϰ� �� �� select �Ͽ� ���� Ȯ���Ѵ�.
		  //select ��� ���� �迭�� ��� ������� ���� �ش�.
			ArrayList<JangDTO>  a = jdao.getAllJang();
						
			//�����͸� jsp������ ���Ѱ� �ش�. ��, �����͸� ������ ����.
			//ArrayList�� jsp������ �Ѱ� ��
			request.setAttribute("a", a);
		
		RequestDispatcher dis = request.getRequestDispatcher("JangList.jsp");
		dis.forward(request, response);
			
		}
}
