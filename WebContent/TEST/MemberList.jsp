<%@page import="com.gabozago.dto.MemberVo"%>
<%@page import="com.gabozago.dto.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<MemberVo> list = (List<MemberVo>) request.getAttribute("memList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td{
   border: 1px solid black;
   border-collapse: collapse;
   text-align: center;
}
table{
   width: 100%;
}

</style>
</head>
<body>
   <h1>히힝</h1>
   <hr><br>
   <table>
      <tr>
         <th>이름</th>
         <th>아이디</th>
         <th>이메일</th>
         <th>전화번호</th>
         <th>유저타입</th>
      </tr>
      <%
      if (list != null) {
         for (MemberVo dto : list) {
      %>
      <tr>
         <td><%=dto.getName()%></td>
         <td><a href="userInfo.do?id=<%=dto.getUserid() %> "><%=dto.getUserid() %></a></td>
         <td><%=dto.getEmail() %></td>
         <td><%=dto.getPhone() %></td>
         <td><%=dto.getAdmin() %></td>
      </tr>
      <%
         }
      }
      %>
   </table>
<jsp:include page="Paging.jsp">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</body>
</html>