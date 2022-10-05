<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%
 int local = (Integer)request.getAttribute("local");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setAttribute("local", local);
%>

</body>
<script type="text/javascript">
location.href = "guideResult.do?local="+local;
/* request.getRequestDispatcher("guideResult.do").forward(request, response); */

</script>
</html>
