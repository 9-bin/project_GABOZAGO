<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	System.out.println("memberSearch.jsp : " + request.getAttribute("type"));
	String type = (String)request.getAttribute("type");
	String key = (String)request.getAttribute("key");
	System.out.println("memberSearch.jsp : " + type + " | " + key);
	session.setAttribute("Type", type);
	session.setAttribute("Key", key);
	out.println("<script>");
	out.println("location.href = 'memberSearchOK.do'");
	out.println("</script>");
%>
</body>
</html>
