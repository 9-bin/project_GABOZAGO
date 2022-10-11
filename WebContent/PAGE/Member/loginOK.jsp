<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object result = request.getAttribute("result");
	if (result.equals(0)) {
		out.println("<script>");
		out.println("alert('로그인에 실패하였습니다')");
		out.println("history.back()");
		out.println("</script>");
	}
	if (result.equals(1)){
		  out.println("<script>");
	      out.println("location.href = 'plan.do'");
	      out.println("</script>");
	}
	if (result.equals(-1)){
		  out.println("<script>");
			out.println("alert('아이디/비밀번호를 다시 확인해주세요.')");
	      out.println("history.back()");
	      out.println("</script>");
	}
%>

</body>
</html>
