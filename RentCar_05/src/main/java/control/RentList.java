package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RentDAO;
import Model.RentDTO;


@WebServlet("/RentListPro.do")
public class RentList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      //�����ͺ��̽� �����Ͽ� ȸ���� ��� ������ �����Ѵ�.
		        RentDAO  rdao = new RentDAO();
				ArrayList<RentDTO>  a = rdao.getAllCar();
							
				//�����͸� jsp������ ���Ѱ� �ش�. ��, �����͸� ������ ����.
				//ArrayList�� jsp������ �Ѱ� ��
				request.setAttribute("a", a);
		         /*System.out.println("a:"+rdao.getAllCar());*/
				RequestDispatcher dis = request.getRequestDispatcher("RentList.jsp");
				dis.forward(request, response);
		   
	}
}
