<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	System.out.println("55 - guideSelectLocation : " + request.getAttribute("sendLocal"));
	int local = (Integer)request.getAttribute("sendLocal");
	System.out.println("56 - guideSelectLocation : " + local);
	session.setAttribute("Local", local);
	out.println("<script>");
	out.println("location.href = 'guideResult.do'");
	out.println("</script>");
%>
</body>
</html>
