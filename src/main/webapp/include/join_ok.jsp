<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입이 완료되었습니다.</h2>
<%--
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String email = request.getParameter("email");
String gender = request.getParameter("gender");

out.println("아이디: "+id);
out.println("<br>");
out.println("비밀번호: "+pw);
out.println("<br>");
out.println("이름: "+name);
out.println("<br>");
out.println("휴대폰번호: "+phone1+"-"+phone2+"-"+phone3);
out.println("<br>");
out.println("이메일: "+email);
out.println("<br>");
out.println("성별: "+gender);
out.println("<br>");
--%>
<form action="main.jsp" method="post">
<input type="submit" value="확인">
</form>
</body>
</html>