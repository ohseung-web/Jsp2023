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

@WebServlet("/ProInfo.do")
public class ProInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProInfos(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProInfos(request, response);
	}
	protected void ProInfos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pro_no = request.getParameter("num");
       productDAO pdao = new productDAO();
       productDTO pdto = new productDTO();
       pdto = pdao.getInfo(pro_no);
       request.setAttribute("img", pdto.getImg());
       request.setAttribute("num", pdto.getPro_no());
       request.setAttribute("name", pdto.getName());
       request.setAttribute("price", pdto.getPrice());
       RequestDispatcher dis = request.getRequestDispatcher("Proinfoform.jsp");
		dis.forward(request, response);
		
		
	}

}