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
	System.out.println("55 - yuna : " + request.getAttribute("placetype"));
	int type = Integer.parseInt((String)request.getAttribute("placetype"));
	String key = (String)request.getAttribute("key");
	int local = Integer.parseInt((String)request.getAttribute("location"));
	
	System.out.println("56 - yuna : " + type + " | " + key + " | " + local);
	
	
	session.setAttribute("Type", type);
	session.setAttribute("Local", local);
	session.setAttribute("Key", key);
	
	out.println("<script>");
	out.println("location.href = 'adminGuideSearchOK.do'");
	out.println("</script>");
%>

</body>
</html>