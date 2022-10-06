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
   width: 90%;
}
</style>
</head>
<body>
<div class="row" style="width: 90%">
<form action="planList.do">
<button type="submit" class="btn btn-outline btn-primary pull-right" id="selectBtn">선택</button>
<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
	<tr>
		<!-- <th>일정 추가</th> -->
		<th>이름</th>
		<th>주소</th>
	</tr>
	<%
	if (list != null) {
		for (GuideVo gVo : list) {
	%>
		<tr>
			<td><input type="checkbox" name="place" value="<%=gVo.getPlacename() %>"><%=gVo.getPlacename() %></td>
			<td><input type="checkbox" name="place" value="<%=gVo.getAdress()%>"><%=gVo.getAdress()%></td>
		</tr>

	<%

		}
	}
	%>
</table>
</form>
</div>
<jsp:include page="./guidePaging.jsp" flush = "false">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</body>
</html>
