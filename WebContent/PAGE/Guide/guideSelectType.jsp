<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	System.out.println("55 - guideSelectType : " + request.getAttribute("type"));
	int type = Integer.parseInt((String)request.getAttribute("type"));
	String key = (String)request.getAttribute("key");
	System.out.println("56 - guideSelectType : " + type + " | " + key);
	session.setAttribute("Type", type);
	session.setAttribute("Key", key);
	out.println("<script>");
	out.println("location.href = 'guideSearchOK.do'");
	out.println("</script>");
%>
</body>
</html>
