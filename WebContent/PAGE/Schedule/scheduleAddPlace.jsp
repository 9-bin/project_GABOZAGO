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
<title>내 일정</title>
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
        <div class="left" style="float: left; width: 384px; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
			
            <!-- 메뉴 -->
            <div style="float: left; width: 100%; height: 100px;">
                <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/searchMenu.jsp" flush="false"/>
                    <hr>
            </div>
            <!-- 가이드 리스트 -->

            <div style="float: left; width: 100%; height: 700px;margin: 20px;">
				 <div style="float: left; width: 100%; height: 150px; margin-top: 20px;">
					<input type="hidden" id="userid" value="${userid}">
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
								<a href="scheduleNext.do?schedulename=${schedulename}">${schedulename}</a><input id="schedulename" type="hidden" value="${schedulename}">
							</th>
						</tr>
					</table>
					<br>
					<div class="row" style="width: 90%">
					<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
						<tr style="font-size: 10px;">
							<th width="100">장소</th>
							<th width="100">주소</th>
							<th width="100">추가</th>
						</tr>
						<%
						if (list != null) {
							int a=1;
							int b=1;
							for (GuideVo gVo : list) {
						%>
						<tr>
							<td onclick="marking<%=a%>()" width="100"><%=gVo.getPlacename() %><input type="hidden" id="Latitude<%=a%>" value="<%=gVo.getLatitude()%>"> <input type="hidden" id="Longtiude<%=a%>" value="<%=gVo.getLongtiude()%>"><input type="hidden" id="<%=b%>" value="<%=gVo.getPlacename()%>"></td>
							<td width="100"><%=gVo.getAdress()%></td>
							<td width="100"><input type="button" value="일정추가" onclick="addPlace<%=a%>()"><input id="placenum<%=a%>" type="hidden" value="<%=gVo.getPlacenum() %>"></td>
						</tr>
						<%
							a+=1;
							b+=2;
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
</div>
        
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
     		<%-- <jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
       	</div>

    
 </div>
</body>
<script src="Script/scheduleInsertPlace.js"></script>
</html>