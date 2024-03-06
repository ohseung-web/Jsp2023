package control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;
import model.MemberDTO;

@WebServlet("/MemberJoinProc.do")
public class MemberJoinProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = new MemberDTO();
		
		// id 중복체크
		String id = request.getParameter("id");
		String checkId = ldao.getOneId(id);
		
		// pw 확인
		String pw = request.getParameter("pw");
		String checkPw = request.getParameter("pwchk");
		
		String pwq = request.getParameter("pwq");
		String pwa = request.getParameter("pwa");
		String name = request.getParameter("name");
		int postcode =  Integer.parseInt(request.getParameter("postcode"));
		String defaultaddr = request.getParameter("defaultaddr");
		String detailaddr = request.getParameter("detailaddr");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1+"-"+phone2+"-"+phone3;
		String email = request.getParameter("email");
		
		mdto.setM_id(id);
		mdto.setM_pw(pw);
		mdto.setM_pwq(pwq);
		mdto.setM_pwa(pwa);
		mdto.setM_name(name);
		mdto.setM_postcode(postcode);
		mdto.setM_defaultaddr(defaultaddr);
		mdto.setM_detailaddr(detailaddr);
		mdto.setM_phone(phone);
		mdto.setM_email(email);
		
		// 아이디/비밀번호/휴대전화/이메일 형식에 관한 정규식 설정
		/*
		 * final String REG_ID = "^[a-z]+[a-z0-9]{3,15}$"; // 영문자로 시작하는 영문자 또는 숫자 4~16자,
		 * 숫자로 시작 x final String REG_PW =
		 * "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~`!@#$%^()*_-{}[]|;:<>,.?/]){8,16}$"; // 영문
		 * 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자
		 */		// 입력 가능 특수문자: ~ ` ! @ # $ % ^ () * _ - {} [] | ; : <> , . ? /
		/*
		 * final String REG_PHONE = "^\\d{3}-\\d{3,4}-\\d{4}$"; // ex) 010-0000-0000,
		 * 010-111-1111 final String REG_EMAIL =
		 * "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9\\-.]+$"; // ex)
		 * jsp2024@gmail.com
		 */		
		// 예외처리 1) 회원정보가 입력되지 않은 상태면 alert 띄우기
		// 2) 아이디/비밀번호/이메일 형식이 맞지 않으면 alert 띄우기
		// 3) 아이디가 중복이면 alert 띄우기
		// 4) 패스워드가 일치하지 않으면 alert 띄우기
		// 5) 위의 조건을 모두 만족하면 insert 한다.
		if(id.equals(checkId)) {
			request.setAttribute("msgError", "이미 존재하는 아이디입니다.");
			RequestDispatcher rd = request.getRequestDispatcher("MemberJoinError.jsp");
			rd.forward(request, response);
		}
		
		/*
		 * if(id==null) { request.setAttribute("msgError", "아이디를 입력해주세요.");
		 * RequestDispatcher rd = request.getRequestDispatcher("MemberJoinError.jsp");
		 * rd.forward(request, response); }else if(pw==null || checkPw==null) {
		 * request.setAttribute("msgError", "비밀번호 항목은 필수 입력값입니다."); RequestDispatcher rd
		 * = request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(pwa==null) { request.setAttribute("msgError",
		 * "비밀번호 확인시 답변 항목은 필수 입력값입니다."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(defaultaddr==null || detailaddr==null) {
		 * request.setAttribute("msgError", "주소를 입력해주세요."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(phone2==null || phone3==null) {
		 * request.setAttribute("msgError", "휴대전화를 입력해주세요."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(email==null) { request.setAttribute("msgError",
		 * "이메일을 입력해주세요."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(Pattern.matches(REG_ID, id) == false) {
		 * request.setAttribute("msgError", "유효하지 않은 아이디입니다."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(Pattern.matches(REG_PW, pw) == false) {
		 * request.setAttribute("msgError", "유효하지 않은 비밀번호입니다."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(Pattern.matches(REG_PHONE, phone) == false) {
		 * request.setAttribute("msgError", "올바른 휴대전화번호를 입력하세요."); RequestDispatcher rd
		 * = request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(Pattern.matches(REG_EMAIL, email) == false) {
		 * request.setAttribute("msgError", "입력하신 이메일을 사용할 수 없습니다."); RequestDispatcher
		 * rd = request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(id.equals(checkId)) { request.setAttribute("msgError",
		 * "이미 존재하는 아이디입니다."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }else if(!pw.equals(checkPw)) { request.setAttribute("msgError",
		 * "패스워드가 일치하지 않습니다."); RequestDispatcher rd =
		 * request.getRequestDispatcher("MemberJoinError.jsp"); rd.forward(request,
		 * response); }
		 */
		else {
			ldao.insertMember(mdto);
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=MemberJoinDone.jsp");
			rd.forward(request, response);
		}
	}
}
