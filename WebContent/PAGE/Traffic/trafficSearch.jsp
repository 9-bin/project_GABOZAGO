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
	System.out.println("55 - local : " + request.getAttribute("local"));
	System.out.println("55 - placetype : " + request.getAttribute("placetype"));
	System.out.println("55 - keyword : " + request.getAttribute("keyword"));
	int local = (Integer)request.getAttribute("local");
	int placetype = (Integer)request.getAttribute("placetype");
	String keyword = (String)request.getAttribute("keyword");
	String startplace = (String)request.getAttribute("startplace");
	String endplace = (String)request.getAttribute("endplace");
	
	System.out.println("56 - trafficSearch : " + local);
	System.out.println("56 - trafficSearch : " + placetype);
	System.out.println("56 - trafficSearch : " + keyword);
	session.setAttribute("local", local);
	session.setAttribute("placetype", placetype);
	session.setAttribute("keyword", keyword);
	session.setAttribute("startplace", startplace);
	session.setAttribute("endplace", endplace);
	
	
	out.println("<script>");
	out.println("location.href = 'trafficSearch.do'");
	out.println("</script>");
%>
</body>
</html>