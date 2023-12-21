package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;


@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
   protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	   //BoardList에 페이징해서 떠넘기기
	   //화면에 보여질 게시글의 개수 지정
	   int pageSize = 10;
	   //현재 보여지고 있는 페이지의 넘버 값 설정
	   String pageNum = request.getParameter("pageNum");
	   if(pageNum == null) {
		   pageNum ="1";
	   }
	   //전체글의 개수를 파악하는 값 설정
       int count = 0;
       //jsp페이지 내에서 보여질 넘버링 숫자 값을 저장하는 변수
       int number = 0;
       
       //현재 보여지고있는 페이지 문자를 숫자로 형변환
       int currentPage = Integer.parseInt(pageNum);
       //전체 게시글의 갯수를 가져와야 하기에 데이터 베이스 객체 생성
       BoardDAO bdao = new BoardDAO();
       count = bdao.getAllCount();
       
       //현재 보여질 페이지 시작번호를 설정한다.
       int startRow = (currentPage - 1)*pageSize+1;
       int endRow = currentPage * pageSize;
       
       //최신글 10개를 기준으로 게시글을 리턴받아 주는 메소드 호출
       ArrayList<BoardDTO> alist = bdao.getAllBoard(startRow,pageSize);
       number = count - (currentPage -1)*pageSize;
       
       //페이징 처리하는 소스코드 변수초기화 작업 ----------------------------------
       int pageCount = 0; //전체 페이지 넘버수를 담는 변수
       int pageBlock = 3; //한 화면에 페이징 하고 싶은 개수
       int startPage = 1; //한 화면에 제일 첫번째 페이징 넘버를 담는 변수
       int result = 0;
       int endPage = 0; //한 화면에 제일 마지막 페이징 넘버를 담는 변수
       
       if(count > 0) {
    	   pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
    	   result = currentPage / pageBlock;
    	   
    	   if(currentPage % pageBlock != 0) {
    		   startPage = result * pageBlock + 1 ;
    	   }else {
    		   startPage = (result-1) * pageBlock + 1 ;
    	   }
    	   
    	   endPage = (startPage + pageBlock) - 1;
    	  
    	   if(endPage > pageCount) {
    		   endPage = pageCount;
    	   }
    	   
       }
       
       ////////////////////////////////////BoardList.jsp 쪽으로 request객체에 담아 넘겨준다.
       request.setAttribute("alist", alist);
       request.setAttribute("number", number);
       request.setAttribute("pageSize", pageSize);
       request.setAttribute("count", count);
       request.setAttribute("currentPage", currentPage);
       
       request.setAttribute("pageCount", pageCount);
       request.setAttribute("pageBlock", pageBlock);
       request.setAttribute("startPage", startPage);
       request.setAttribute("result", result);
       request.setAttribute("endPage", endPage);
       
       
       RequestDispatcher rdis = request.getRequestDispatcher("BoardList.jsp");
       rdis.forward(request, response);
       
   }

}
