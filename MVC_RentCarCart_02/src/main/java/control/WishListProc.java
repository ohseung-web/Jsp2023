package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JangDAO;
import model.JangDTO;


@WebServlet("/WishListProc.do")
public class WishListProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
   
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	JangDTO jdto = new JangDTO();
    	JangDAO jdao = new JangDAO();
    	ArrayList<JangDTO> arr = new ArrayList<JangDTO>();
    	
    	String no = request.getParameter("no");
    	String img = request.getParameter("img");
    	String name = request.getParameter("name");
    	String price = request.getParameter("price");
    	
    	System.out.println(no);
    	
    	String wish = request.getParameter("wish");
    	//사용자 컴퓨터의 쿠키 저장소로부터 쿠키 값을 읽어 들인다.
        //몇개인지 모르기때문에 배열을 이용하여 쿠키 값을 저장한다.
        Cookie[] cookies = request.getCookies();
        String noCookie ="";
        
        // 반드시 null처리 한다
        if(cookies != null){
      	  for(int i=0;i<cookies.length;i++){
      		  if(cookies[i].getName().equals(no)){
      			 noCookie = cookies[i].getValue();
      			  break; //원하는 데이터를 찾았기 때문에 반복문을 빠져나온다.
					 } 
      	  }
        }
        
        if(no !=null && !no.isEmpty()) {
      	    
      	    jdao.buyselect(Integer.parseInt(no));
      	    arr.add(jdto);
     	 }
        
     // 체크되었는지를 비교판단한다.
        if(wish != null){
       	 //쿠키를 사용하려면 쿠키 클래스를 생성해야 한다.
            // 단, 반드시 new Cookie("key값","해당하는 value값")으로 정의 해야한다.
            Cookie cookieNo = new Cookie("no",no);
            Cookie cookieImg = new Cookie("img",img);
            Cookie cookieName= new Cookie("name",name);
            Cookie cookiePrice = new Cookie("price",price);
            
       	 //쿠키 유효시간 설정
       	 cookieNo.setMaxAge(60*2); // 10분간 유효
       	 
       	 //사용자에게 cookie값을 넘겨 준다.
       	 response.addCookie(cookieNo);
         response.addCookie(cookieImg);
       	 response.addCookie(cookieName);
       	 response.addCookie(cookiePrice);
       	// response.sendRedirect("")
       	
        }
        request.setAttribute("arr", arr);
      
        RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=WishList.jsp");
        rdis.forward(request, response);
        
	}
}
