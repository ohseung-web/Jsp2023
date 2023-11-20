package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.PaulDTO;

@WebServlet("/ChangeBoard.do")
public class ChangeBoardProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bdao = new BoardDAO();
		PaulDTO pdto = new PaulDTO();
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		
		
		pdto = bdao.getOneBoard(b_no);
		request.setAttribute("b_no",pdto.getB_no());
		
		String title = pdto.getB_subject();
		
		int point= title.indexOf("]")+1;	   // 제목만 구하기 위한 유형 다음부분을 구할 숫자???
		if(point >=0) {
			String subject = title.substring(point);
			request.setAttribute("b_subject",subject);
		}
		pdto.setB_contents(pdto.getB_contents().replace("<br>", "\r\n"));
		request.setAttribute("u_id",pdto.getU_id());
		request.setAttribute("b_date",pdto.getB_date());
		request.setAttribute("b_contents",pdto.getB_contents());
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=UpDateBoard.jsp");
		dis.forward(request, response);
	}

}
