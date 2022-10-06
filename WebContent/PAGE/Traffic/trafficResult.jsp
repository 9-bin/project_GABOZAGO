<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<GuideVo> list = (List<GuideVo>) request.getAttribute("guideList");
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
<div class="row" style="width: 100%">
<form action="" method="get">
<table id="example-table-3" width="100%" class="table table-bordered table-hover text-center">
	<tr>
		<th>이름</th>
		<th>선택</th>
	</tr>
	<%
	if (list != null) {
		for (GuideVo gVo : list) {
	%>
		<tr>
			<td><%=gVo.getPlacename() %></td>
			<td><input type="button" value="출발지"><input type="button" value="도착지"></td>
		</tr>
	<%
		}
	}
	%>
</table>
</form>
<jsp:include page="./Paging.jsp" flush = "false">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</div>
</body>
</html>