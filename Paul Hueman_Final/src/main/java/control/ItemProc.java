package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaulDTO;
import model.ProductDAO;

@WebServlet("/Item.do")
public class ItemProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		int color = Integer.parseInt(request.getParameter("color"));
		String colorName = "";
		ProductDAO pdao = new ProductDAO();
		PaulDTO pdto = pdao.getItem(code);
		switch(color) {
		case 1:
			colorName = pdto.getP_color1();
			break;
		case 2:
			colorName = pdto.getP_color2();
			break;
		case 3:
			colorName = pdto.getP_color3();
			break;
		}
		request.setAttribute("color", color);
		request.setAttribute("colorName", colorName);
		request.setAttribute("pdto", pdto);
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Item.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
