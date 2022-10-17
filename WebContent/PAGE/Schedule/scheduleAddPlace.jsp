<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
List<GuideVo> list = (List<GuideVo>) request.getAttribute("guideList");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
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
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
	<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
	<!--영역 안에서 세로로 나누기-->    
	   <!--1(왼쪽)-->
	   <div class="left" style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
	

	           <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
	               <hr>

        
            <!-- 가이드 리스트 -->

            <div style="float: left; width: 100%; height: 700px;margin: 20px;">
				<div class="row" style="width: 90%">
					<input type="hidden" id="userid" value="${userid}">
					<input type="hidden" id="markerLat" value="36.1676050697">
					<input type="hidden" id="markerLon" value="128.0824067374">
					<form action="scheduleAddSearchNext.do?local=${local}&placetype=${placetype}&keyword=${keyword}">
						<table style="border-collapse: collapse;">
							<tr>
					         	<td>
					         		<select name="local">
							         	<option ${(local=="0")?"selected":""} value="0">지역</option>
										<option ${(local=="1")?"selected":""} value="1">강릉</option>
										<option ${(local=="2")?"selected":""} value="2">부산</option>
										<option ${(local=="3")?"selected":""} value="3">서울</option>
										<option ${(local=="4")?"selected":""} value="4">여수</option>
										<option ${(local=="5")?"selected":""} value="5">제주</option>
										<option ${(local=="6")?"selected":""} value="6">천안,아산</option>
									</select>
								</td>
								<td><select name="placetype">
					         		<option ${(placetype=="0")?"selected":""} value="0">타입</option>
					         		<option ${(placetype=="1")?"selected":""} value="1">관광지</option>
					         		<option ${(placetype=="2")?"selected":""} value="2">레포츠</option>
									<option ${(placetype=="3")?"selected":""} value="3">문화시설</option>
									<option ${(placetype=="4")?"selected":""} value="4">숙박시설</option>
									<option ${(placetype=="5")?"selected":""} value="5">음식점</option>
								</select></td>
								<td><input style="width:100px;" type="text" name="keyword" value="${keyword}" placeholder="장소이름"></td>
								<td>
									<button type="submit">검색</button>
								</td>
							</tr>
						</table>
					</form>
					
					<table>
						<tr>
							<th>
								일정 이름: ${schedulename}<input id="schedulename" type="hidden" value="${schedulename}">
							</th>
							<td>
								<button type="submit" class="btn btn-outline btn-primary pull-right" 
								id="selectBtn" name="add" style="float: right" onclick="addPlace()">일정추가</button>
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
							int a=1;
							for (GuideVo gVo : list) {
						%>
						<tr>
							<td onclick="marking<%=a%>()" width="50"><%=gVo.getPlacename() %><input type="hidden" id="Latitude<%=a%>" value="<%=gVo.getLatitude()%>"> <input type="hidden" id="Longtiude<%=a%>" value="<%=gVo.getLongtiude()%>"></td>
							<td width="150"><%=gVo.getAdress()%></td>
							<td width="100"><input type="button" value="일정추가" onclick="addPlace<%=a%>()"><input id="placenum<%=a%>" type="hidden" value="<%=gVo.getPlacenum() %>"></td>
						</tr>
						<%
							a+=1;
							}
						}
						%>
					</table>
					
				</div>
				<jsp:include page="./addPlacePaging.jsp" flush = "false">
				<jsp:param value="${paging.page}" name="page"/>
				<jsp:param value="${paging.beginPage}" name="beginPage"/>
				<jsp:param value="${paging.endPage}" name="endPage"/>
				<jsp:param value="${paging.prev}" name="prev"/>
				<jsp:param value="${paging.next}" name="next"/>
				</jsp:include>
			</div>

            

        </div>

        
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
     		<%-- <jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
       	</div>

    </div>
 
</body>
<script src="Script/scheduleInsertPlace.js"></script>
</html>