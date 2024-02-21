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

@WebServlet("/MainList.do")
public class MainList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	
    	LivingDAO ldao = new LivingDAO();
    	String category = request.getParameter("category");
    	if(category == null) {
    		category = "1";
    	}
        
    	ArrayList<ProductDTO> plist = ldao.getAllMainProduct(Integer.parseInt(category));
    	ArrayList<ProductDTO> pblist = ldao.getAllMainProduct(6);
        if(Integer.parseInt(category) == 4) {
    		 plist = ldao.getAllMainProduct(4);
    	}else if(Integer.parseInt(category) == 3) {
    		 plist = ldao.getAllMainProduct(3);
    	}else if(Integer.parseInt(category) == 5) {
    		 plist = ldao.getAllMainProduct(5);
    	}
    
        request.setAttribute("pblist", pblist);
    	request.setAttribute("plist", plist);

		/*
		 * String section = request.getParameter("section"); if(section == null) {
		 * request.setAttribute("section", section); }
		 */
    	RequestDispatcher rdis = request.getRequestDispatcher("Main.jsp");
    	rdis.forward(request, response);
	}

}
