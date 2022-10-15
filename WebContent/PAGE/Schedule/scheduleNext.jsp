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
	System.out.println("55 - userid : " + request.getAttribute("userid"));
	System.out.println("55 - schedulename : " + request.getAttribute("schedulename"));
	
	String userid = (String)request.getAttribute("userid");
	String schedulename = (String)request.getAttribute("schedulename");

	System.out.println("56 - scheduleNext : " + userid);
	System.out.println("56 - scheduleNext : " + schedulename);

	session.setAttribute("userid", userid);
	session.setAttribute("schedulename", schedulename);

	
	out.println("<script>");
	out.println("location.href = 'scheduleDetail.do'");
	out.println("</script>");
%>
</body>
</html>