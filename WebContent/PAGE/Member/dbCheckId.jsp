
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   Integer result = (Integer)request.getAttribute("result");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="user_id" value="${param.userid}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b><font size="4" color="gray">아이디 중복 확인</font></b>
<br>

<form name="checkIdForm">
   <input type="text" name="id" value="${user_id}" id="userid" disabled>
   <c:choose>
   <c:when test="${result==1}">
      <p style="color:red">이미 사용중인 아이디입니다.</p>
      <input type="hidden" name="chResult" value="N" />
   </c:when>
      <c:when test="${result==0}">
      <p style="color:blue">사용 가능한 아이디입니다.</p>
      <input type="hidden" name="chResult" value="Y" />
   </c:when>
   <c:otherwise>
      <p>오류 발생(-1)</p>
      <input type="hidden" name="chResult" value="N" />
   </c:otherwise>
   </c:choose>
   
   <input type="button" onclick="window.close()" value="취소" /><br>
   <input type="button" onclick="sendCheckValue()" value="사용하기" />
</form>
<script type="text/javascript">
function sendCheckValue() {
   var openJoinfrm = opener.document.frm;
   
   if (document.checkIdForm.chResult.value=="N") {
      alert("다른 아이디를 입력해주세요");
      openJoinfrm.id.focus();
      window.close();
   } else {
      openJoinfrm.idDuplication.value="idCheck";
      openJoinfrm.dbCheckId.disabled=true;
      openJoinfrm.dbCheckId.style.opacity=0.6;
      openJoinfrm.dbCheckId.style.cursor="default";
      window.close();
   }
}
</script>
</body>

</html>