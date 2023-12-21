package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.jangDAO;
import model.jangDTO;
import model.productDAO;
import model.productDTO;

/**
 * Servlet implementation class jang
 */
@WebServlet("/jang.do")
public class jang extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         jangbaguni(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         jangbaguni(request, response);
	}
	protected void jangbaguni(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int cnt = Integer.parseInt(request.getParameter("cnts"));
       String num = request.getParameter("num");
       productDAO pado = new productDAO();
       productDTO pdto = new productDTO();
       pdto = pado.getInfo(num);
       jangDAO jdao = new jangDAO();
       jangDTO jdto = new jangDTO();
       jdto.setCnt(cnt);
       jdto.setImg(pdto.getImg());
       jdto.setName(pdto.getName());
       jdto.setPrice(pdto.getPrice());
       jdto.setPro_no(pdto.getPro_no());
       jdao.insertjang(jdto);
       request.setAttribute("img",pdto.getImg() );
       request.setAttribute("num",pdto.getPro_no() );
       request.setAttribute("price",pdto.getPrice() );
       request.setAttribute("name",pdto.getName() );
       request.setAttribute("cnt",jdto.getCnt() );
       RequestDispatcher dis = request.getRequestDispatcher("finish.jsp");
		dis.forward(request, response);
	}


}
