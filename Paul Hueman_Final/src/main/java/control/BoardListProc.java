package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.PaulDTO;


@WebServlet("/BoardListProc.do")
public class BoardListProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDAO bdao = new BoardDAO();
		ArrayList<PaulDTO> a = bdao.getAllList();
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String regex = df.format(today);
		for(int i = 0; i < a.size(); i++) {
			if(a.get(i).getB_date().substring(0, 10).matches(regex)) a.get(i).setB_date(a.get(i).getB_date().substring(11, 16));
			else a.get(i).setB_date(a.get(i).getB_date().substring(0, 10));
		}
		request.setAttribute("a", a);		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("paul_login");
		if(id != null && !id.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Boardlist.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=NoLoginList.jsp");
			dis.forward(request, response);
		}
		
	}
}
