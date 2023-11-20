package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaulDTO;
import model.ProductDAO;


@WebServlet("/ItemList.do")
public class ItemListProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemListProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cate = Integer.parseInt(request.getParameter("cate"));
		ProductDAO pdao = new ProductDAO();
		ArrayList<PaulDTO> list = pdao.getList(cate);
		request.setAttribute("cate", cate);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=ItemList.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
