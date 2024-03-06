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

@WebServlet("/SearchProductProc.do")
public class SearchProductProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	  request.setCharacterEncoding("UTF-8");
    	
    	  LivingDAO ldao = new LivingDAO();
    	  String keyword = request.getParameter("keyword");
    	  
    	  System.out.println("특정문자 :" + keyword);
    	
    	  // 페이징 시작
		
    			int pageSize = 12;
    			
    			String pageNum = request.getParameter("pageNum");
    			if(pageNum==null) {
    				pageNum = "1";
    			}
    			
    			String order = request.getParameter("order");
    			if(order == null) {
    				order = "1";
    			}
    			
    			int count = 0;
    			int number = 0;
    			
    			int currentPage = Integer.parseInt(pageNum);
    			
    			count = ldao.getAllSearchCount(keyword);
    			
    			int startRow = (currentPage - 1) * pageSize + 1;
    			int endRow = currentPage * pageSize;
    			
    			ArrayList<ProductDTO> Slist = new ArrayList<>();
    			
    			if(Integer.parseInt(order) == 1) {
    				Slist = ldao.searchProduct(keyword,startRow,pageSize);
    			}else if(Integer.parseInt(order) == 2) {
    				Slist = ldao.searchDescProduct(keyword,startRow,pageSize);
    			}else {
    				Slist = ldao.searchAscProduct(keyword,startRow,pageSize);
    			}
    			
    			number = count - (currentPage - 1) * pageSize;
    			
    			int pageCount = 0;
    			int pageBlock = 1;
    			int startPage = 1;
    			int endPage = 0;
    			
    			if(count>0) {
    				pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
    				
    				if(currentPage % pageBlock != 0) {
    					startPage = (currentPage / pageBlock) * pageBlock + 1;
    				}else {
    					startPage = ((currentPage / pageBlock)-1) * pageBlock + 1;
    				}
    				
    				endPage = startPage + pageBlock - 1;
    				
    				if(endPage > pageCount) {
    					endPage = pageCount;
    				}
    			}
    			
    			// 페이징 종료
    			request.setAttribute("count", count);
    			request.setAttribute("pageNum", pageNum);
    			request.setAttribute("currentPage", currentPage);
    			request.setAttribute("pageCount", pageCount);
    			request.setAttribute("pageBlock", pageBlock);
    			request.setAttribute("startPage", startPage);
    			request.setAttribute("endPage", endPage);

    			request.setAttribute("order", order);
    			request.setAttribute("keyword", keyword);
    			request.setAttribute("Slist", Slist);
    			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=SearchProductList.jsp");
    			rd.forward(request, response);
	}
}
