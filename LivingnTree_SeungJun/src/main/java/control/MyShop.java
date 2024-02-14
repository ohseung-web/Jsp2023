package control;

import java.io.IOException;
import java.text.ParseException;
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

import model.LivingDAO;
import model.MemberDTO;
import model.OrderHistDTO;
import model.OrderdetailDTO;


@WebServlet("/MyShop.do")
public class MyShop extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		} catch (ServletException | IOException | ParseException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		} catch (ServletException | IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		// 오티 작성 코드
//		HttpSession session = request.getSession();
//		String loginId = (String)session.getAttribute("loginId");
//		
//		LivingDAO ldao = new LivingDAO();
//		ArrayList<OrderdetailDTO> odarr = ldao.getOrdersByLoginId(loginId);
//		MemberDTO mdto = ldao.getMemberByLoginId(loginId);
//	
//	    // 구매일자와 오늘일자를 비교하여 오늘일자가 구매일자보다 크면 '배송완료' 아니면 '배송준비중' 출력	
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date today = new Date(); // 오늘날짜
//		Date orderday =  new Date(); // 구매일자
//	
//		today = sdf.parse(sdf.format(today));
//		
//		for(int i=0; i<odarr.size(); i++) {
//			orderday = sdf.parse(odarr.get(i).getO_date());
//		}
//		
//		System.out.println("오늘일자 "+today);
//		System.out.println("구매일자 "+orderday);
//		
//		int compare = orderday.compareTo(today);
//		// 구매날짜와 오늘날짜가 같으면 0이 넘어옴
//		// 구매날짜보다 오늘날짜가 크다면 -1이 넘어옴
//		// 구매날짜가 오늘날짜 보다 크거나 같으면 1이 넘어몸;
//		
//		// OrderdetailDTO의 오늘날짜와 구매일자를 비교하여 배송여부를 delivchk에 저장한다. 
//		for(int i=0; i<odarr.size(); i++) {
//			
//			if(compare == -1) {
//				odarr.get(i).setDelivchk("배송완료"); 
//			}else {
//				odarr.get(i).setDelivchk("배송준비중"); 
//			}
//		}
//		
//		request.setAttribute("mdto", mdto);
//		request.setAttribute("odto", odarr);
//		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=MyShop.jsp");
//		rd.forward(request, response);
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = ldao.getMemberByLoginId(loginId);
		ArrayList<OrderHistDTO> oharr = ldao.getOrdersByLoginId(loginId);
		
		// 구매일자와 오늘일자를 비교하여 오늘일자가 구매일자보다 크면 '배송완료' 아니면 '배송준비중' 출력
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date(); // 오늘날짜
		Date orderday = new Date(); // 구매일자
		
		today = sdf.parse(sdf.format(today));
		
		// OrderHistDTO의 오늘날짜와 구매일자를 비교하여 배송여부를 delivchk에 저장한다.
		for(int i=0;i<oharr.size();i++) {
			orderday = sdf.parse(oharr.get(i).getO_date());
			if(orderday.equals(today)) {
				oharr.get(i).setDelivchk("배송준비중");
			}else {
				oharr.get(i).setDelivchk("배송완료");
			}
		}
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("oharr", oharr);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=MyShop.jsp");
		rd.forward(request, response);
	}
}