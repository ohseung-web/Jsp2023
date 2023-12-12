<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
     request.setCharacterEncoding("UTF-8");
     //프로젝트내에 만들어질 폴더를 저장할 이름변수선언
     String realfolder ="";
     //실제 만들어질 폴더명을 설정
     String savefolder="/upload";
     //한글설정
     String encType="UTF-8";
     //저장할 파일 사이즈를 설정
     int maxSize = 1024*1024*5; //5MB
     
     //파일이 저장될 경로값을 읽어오는 객체 선언
     ServletContext context = getServletContext();
     realfolder = application.getRealPath(savefolder);
     
     try{
    	 //클라이언트로부터 넘어온 데이터를 저장해주는 객체
    	 //cos.jar 파일에서 가지고온 객체이다.
    	 // new DefaultFileRenamePolicy() : 이름이 같은 파일이 업로드 될때 , 이름을 자동으로 변경해주는 클래스
         MultipartRequest multi = new MultipartRequest(request,realfolder,maxSize,encType, new DefaultFileRenamePolicy());  	 
 %>
         당신의 이름은 : <%=multi.getParameter("name") %>
         
 <%
     out.println(realfolder);
 
     }catch(Exception e){
    	 e.printStackTrace();
     }
  %>
</body>
</html>