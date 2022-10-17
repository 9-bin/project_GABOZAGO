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

<table id="example-table-3" width="100%" class="table table-bordered table-hover text-center">
	<tr>
		<th>이름</th>
		<th>선택</th>
	</tr>
	<%
	if (list != null) {
		int a = 1;
		int b = 2;
		int c = 1;
		for (GuideVo gVo : list) {
	%>
		<tr>
			<td onclick="marking<%=c%>()"><%=gVo.getPlacename()%><input type="hidden" id="Latitude<%=c%>" value="<%=gVo.getLatitude()%>"> <input type="hidden" id="Longtiude<%=c%>" value="<%=gVo.getLongtiude()%>"></td>
			<td>
				<button id="<%=a%>" onclick="startPlace<%=c%>()" value="<%=gVo.getPlacename()%>">출발지</button>
  				<button id="<%=b%>" onclick="endPlace<%=c%>()" value="<%=gVo.getPlacename()%>">도착지</button>
			</td>
		</tr>
	<%
		a+=2;
		b+=2;
		c+=1;
		}
	}
	%>
	
</table>
<jsp:include page="./Paging.jsp" flush = "false">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
<script src="Script/selectStartEnd.js"></script>
</div>
</body>
</html>