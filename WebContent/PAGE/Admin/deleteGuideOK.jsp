<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인</title>
</head>
<body>
<%



	Object result = request.getAttribute("count");
	if (result.equals(1)) {
	      out.println("<script>");
	      out.println("alert('장소 삭제가 완료되었습니다. (╯︿╰) ')");
	      out.println("location.href = 'adminGuide.do'");
	      out.println("</script>");
	}
	if (result.equals(0)){
		  out.println("<script>");
	      out.println("alert('장소 삭제에 실패하였습니다.')");
	      out.println("location.href = 'adminGuideDelete.do'");
	      out.println("</script>");
	}
%>


</body>
</html>