<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
List<GuideVo> list = (List<GuideVo>) request.getAttribute("guideList");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
<div class="row" style="width: 100%">

<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
	<tr style="font-size: 10px;">
		<th id="th_name" width="200" style="overflow: hidden;">이름</th>
		<th id="scrollBar" width="170" style="overflow: auto;">선택</th>
	</tr>
	<%
	if (list != null) {
		int a = 1;
		int b = 2;
		int c = 1;
		for (GuideVo gVo : list) {
	%>
		<tr>
			<td onclick="marking<%=c%>()" id="th_name" width="200" style="overflow: hidden;"><%=gVo.getPlacename()%><input type="hidden" id="Latitude<%=c%>" value="<%=gVo.getLatitude()%>"> <input type="hidden" id="Longtiude<%=c%>" value="<%=gVo.getLongtiude()%>"></td>
			<td id="scrollBar" width="170" style="overflow: auto;">
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