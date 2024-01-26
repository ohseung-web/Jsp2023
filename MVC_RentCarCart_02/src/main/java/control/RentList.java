package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RentDAO;
import model.RentDTO;

@WebServlet("/RentListPro.do")
public class RentList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	//데이터베이스 연결하여 모든 자동차 정보를 리턴한다.
    	RentDAO rdao = new RentDAO();
    	//category별 메뉴 클릭을 위하여
    	int category = 0;
    	if(request.getParameter("category") != null) {
    	   category = Integer.parseInt( request.getParameter("category"));
    	}
    	
    //	ArrayList<RentDTO> alist = rdao.getAllCar();
    	
    	/////////////////////////   페이징 소스 코드 부분    ///////////////////////
    	 // BoardList에 페이징해서 떠넘기기
 	   // 한 화면에 보여질 게시글의 개수 지정하여 담는 변수
 	   int pageSize = 5;
 	   
 	   //현재 화면에 보여지고 있는 페이지의 넘버 값 설정 [1] [2] [3]..
 	   String pageNum = request.getParameter("pageNum");
 	   if(pageNum == null) {
 		   pageNum ="1";
 	   }
 	   
 	   //전체 게시글의 개수를 파악하여 담는 변수
        int count = 0;
        
        // 게시글의 번호 최신글순으로 출력되도록 번호를 지정하여 넣는 변수
        // jsp화면에 보여질 [번호]부분에 들어가갈 값을 담는 변수
     //   int number = 0;
        
        //현재 보여지고있는 페이지 문자를 숫자로 형변환
        int currentPage = Integer.parseInt(pageNum);
        //전체 게시글의 갯수를 데이터 베이스에서 가저오기에 BoardDAO객체 생성
       
        count = rdao.getAllCount(category);
        
        //현재 보여질 페이지 시작번호를 설정한다.
        //현재보여지는 페이지번호가 1이라고 가정하면 startRow = (1 - 1)*5+1 => 1
        int startRow = (currentPage - 1)*pageSize+1;
        //mysql에서는 endRow를 사용하지 않는다. 대신, pageSize 사용
        int endRow = currentPage * pageSize;
        
        //최신글 5개를 기준으로 게시글을 리턴받아 주는 메소드 호출
        ArrayList<RentDTO> alist = rdao.getAllRentcar(category,startRow,pageSize);
        
        // jsp 화면에 [번호]부분에 들어갈 number 값을 계산하는 식이다. 
    	   // 단, 최신글 순서대로 번호가 출력된다.
    	   // count = 9, currentPage =1 이라고 가정하고 계산하면 number = 9-(1-1)*5  = 9
    	   // currentPage = 2라고 가정하고 계산하면 number = 9 - (2-1)*5 = 4가된다.
    	   // 고로 [1]페이지는 9 8 7 6 5까지 [번호]가 출력되고, [2]페이지는 4 3 2 1로 출력된다는 의미이다.
     //   number = count - (currentPage -1)*pageSize;
        
        //페이징 처리하는 소스코드 변수초기화 작업 ----------------------------------
        int pageCount = 0; //전체 페이지 넘버수를 담는 변수
        int pageBlock = 1; //한 화면에 페이징 하고 싶은 개수
        int startPage = 1; //한 화면에 제일 첫번째 페이징 넘버를 담는 변수
        int endPage = 0; //한 화면에 제일 마지막 페이징 넘버를 담는 변수
        
        if(count > 0) {
     	   //  count => 18
     	   //  pageSize => 5
     	   //     18 % 5 ==> 3(나머지) 고로 1출력
     	   //	  18/5 ==> 3.6
     	   //	  3.6+1 => 4.6
     	   //	  그러므로 전체 페이징 개수는 pageCount = 4 이다. 
     	   //	  다시말해 현재 화면에 [1] [2] [3] [다음]  -> [이전] [4]
     	   pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
     	   
     	   // 첫 화면에 [1] [2] [3]의 1을, 두번재 화면의 [4] [5] [6]의 4를 담는 변수
     	   if(currentPage % pageBlock != 0) { 
     		   startPage = (currentPage / pageBlock) * pageBlock + 1 ;
     	   }else {
     		   startPage = ((currentPage / pageBlock )-1) * pageBlock + 1 ;
     	   }
     	   
     	   // 첫 화면에 [1] [2] [3]의 3을, 두번쨰 화면의 [4] [5] [6]의 6을 담는변수
     	   endPage = startPage + pageBlock - 1;
     	  
     	   // 아래 조건을 작성하지 않으면 [다음] [4] [5] [6]까지 페이징 번호가 출력된다.
     	   // 그러나, [5] [6]페이지는 게시글이 존재하지 않기때문에 출력되지 않도록 조건을 지정하는 부분이다.
     	   if(endPage > pageCount) {
     		   endPage = pageCount;
     	   }
     	   
        }
    	
     //   request.setAttribute("number", number);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("count", count);
        request.setAttribute("currentPage", currentPage);
        
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("pageBlock", pageBlock);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("cate", category);
    	
    	request.setAttribute("alist", alist);
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=RentList.jsp");
    	rdis.forward(request, response);
    	
	}

}

