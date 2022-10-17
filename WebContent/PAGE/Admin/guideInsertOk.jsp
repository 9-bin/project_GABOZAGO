<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드 입력</title>
</head>
<body>

<%
	Object result = request.getAttribute("cnt");
	if (result.equals(0)) {
	      out.println("<script>");
	      out.println("alert('장소등록 실패.')");
	      out.println("history.back()");
	      out.println("</script>");
	}
	if (result.equals(1)){
		  out.println("<script>");
	      out.println("location.href = 'adminGuide.do'");
	      out.println("</script>");
	}
%>

</body>
</html>