package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.productDAO;
import model.productDTO;


@WebServlet("/ProductList.do")
public class ProductList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProList(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   ProList(request, response);
	}
	protected void ProList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		productDAO pdao = new productDAO();
		ArrayList<productDTO> a = new ArrayList<productDTO>();
		
		a = pdao.list();
		request.setAttribute("a", a);
	     RequestDispatcher dis = request.getRequestDispatcher("Proform.jsp");
				dis.forward(request, response);
		
		
	}

}
