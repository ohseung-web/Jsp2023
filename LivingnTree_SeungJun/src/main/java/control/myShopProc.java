package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;
import model.ProductDTO;

@WebServlet("/myShopProc.do")
public class myShopProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
   protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   request.setCharacterEncoding("UTF-8");
	   
	   LivingDAO ldao = new LivingDAO();
	   ProductDTO pdto = new ProductDTO();
	   
	   int code = Integer.parseInt(request.getParameter("code"));
	   int price = Integer.parseInt(request.getParameter("price"));
	   String mainimg = request.getParameter("mainimg");
	   
	   // 나의 위시리스트 만들기
	   // 1. myShopDTO 작성하기
	   
	}

}
