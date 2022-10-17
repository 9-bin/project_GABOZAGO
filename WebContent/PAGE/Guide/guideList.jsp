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
<script type="text/javascript" src="Script/selectPlace.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style>
#example-table-3{
	   table-layout:fixed;
	   width: 90%;
}

#example-table-3, th, td{
   display : inline-block;
   white-space : nowrap;
   overflow : hidden;
}
</style>
</head>
<body>
<div class="row" style="width: 90%">
	<form action="guideAllSearch.do?guideSearch=${guideSearch}">
		<table style="border-collapse: collapse;">
			<tr>
	         	<td><select name="guideSearch">
	         		<option value="0" selected="selected">유형선택</option>
	         		<option value="1">관광지</option>
	         		<option value="2">레포츠</option>
					<option value="3">문화시설</option>
					<option value="4">숙박시설</option>
					<option value="5">음식점</option>
				</select></td>
				<td>
					<button type="submit">검색</button>
				</td>
			</tr>
		</table>
	</form>
	<form action="planList.do" name="sfrm" >
		<table>
			<tr>
				<th>
					일정 이름: <input type="text" name="Sname" value="${Sname}" aria-label="일정 이름 쓰기">
				</th>
				<td>
					<button type="submit" class="btn btn-outline btn-primary pull-right" 
					id="selectBtn" name="add" style="float: right" onclick="return addPlace()">일정추가</button>
				</td>
			</tr>
		</table>
		<br>
		<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
			<tr style="font-size: 10px;">
				<th width="50">장소번호</th>
				<th width="150">이름</th>
				<th width="100">주소</th>
			</tr>
			<%
			if (list != null) {
				for (GuideVo gVo : list) {
			%>
			<tr>
				<td width="50"><input type="radio" name="placenum" value="<%=gVo.getPlacenum() %>"><%=gVo.getPlacenum() %></td>
				<td width="150"><%=gVo.getPlacename() %></td>
				<td width="100"><%=gVo.getAdress()%></td>
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
