<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	System.out.println("55 - guideAllSearchResult : " + request.getAttribute("type"));
	int type = Integer.parseInt((String)request.getAttribute("type"));
	System.out.println("56 - guideAllSearchResult : " + type);
	session.setAttribute("Type", type);
	out.println("<script>");
	out.println("location.href = 'guideAllSearchOK.do'");
	out.println("</script>");
%>
</body>
</html>
