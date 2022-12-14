<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%
List<GuideVo> list = (List<GuideVo>) request.getAttribute("guideList");
List<GuideVo> list1 = (List<GuideVo>) request.getAttribute("guideList1");
String schedulename = (String)request.getAttribute("schedulename");
String userId = (String) session.getAttribute("userId");	// 세션값 얻어오기
request.setAttribute("userId", userId);						// 세션값 저장하기
// 디버깅
System.out.println("jsp userId " + userId);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 일정</title>
</head>
<body>
    <!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color:whitesmoke">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 384px; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
			
            <!-- 메뉴 -->
            <div style="float: left; width: 100%; height: 100px;">
                <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
            <!-- 선택한 장소 목록 보여주기 -->
            <!-- 가이드 리스트 -->
            <div style="float: left; width: 100%; height: 740px;margin: 20px;">
           		<div class="row" style="width: 90%">
				
				<!-- 일정 상세 목록 부분 -->
	            <div style="float: left; width: 100%; height: 90px;">
	            	<form action="scheduleAddSearch.do" method="post">
	            	<b id="schedulename"><%=schedulename%></b>
	                <button type="submit" class="btn btn-outline btn-primary pull-right" id="selectBtn" style="float: right">일정 추가</button>
	                </form>
	                <br>
	                <form action="schedule.do" method="post">
	                <button type="submit" class="btn btn-outline btn-primary pull-right" id="selectBtn" style="float: right">일정 목록</button>
	                </form>
	                <br><br>
	                <input type="hidden" id="userid" value="<%=userId%>">
	            </div>
				<hr>
				<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
						<tr>
							<th>장소명</th>
							<th>주소</th>
							<th>삭제</th>
						</tr>
						<%
							if (list != null) {
								int a=1;
								int b=1;
								for (GuideVo gVo : list) {
							%>
							<tr>
								<td onclick="center<%=a%>()" id="Place<%=a%>"><%=gVo.getPlacename() %>
								<input type="hidden" id="latitude<%=a%>" value="<%=gVo.getLatitude()%>">
							<input type="hidden" id="longtiude<%=a%>" value="<%=gVo.getLongtiude()%>">
							<input type="hidden" id="Pn<%=a%>" value="<%=gVo.getPlacename()%>"></td>
								<td id="Adress<%=a%>"><%=gVo.getAdress()%></td>
								<td><input type="button" onclick="deletePlace<%=a%>()" value="삭제">
								<input type="hidden" id="Placenum<%=a%>" value="<%=gVo.getPlacenum()%>"></td>
							</tr>
							
						<%
							a+=1;
							b+=2;
							}
						}
						%>
				</table>
						<%
							
							if (list1 != null) {
								int a=1;
								for (GuideVo gVo : list1) {
							%>
							<input type="hidden" id="Latitude<%=a%>" value="<%=gVo.getLatitude()%>">
							<input type="hidden" id="Longtiude<%=a%>" value="<%=gVo.getLongtiude()%>">
							<input type="hidden" id="pn<%=a%>" value="<%=gVo.getPlacename()%>">
							
						<%
							a+=1;
							}
								%>
							<input type="hidden" id="count" value="<%=a-1%>">
							<%
						}
						%>
				</div>
				<%-- <% System.out.println(); %> --%>
				<jsp:include page="./detailPaging.jsp" flush = "false">
					<jsp:param value="${paging.page}" name="page"/>
					<jsp:param value="${paging.beginPage}" name="beginPage"/>
					<jsp:param value="${paging.endPage}" name="endPage"/>
					<jsp:param value="${paging.prev}" name="prev"/>
					<jsp:param value="${paging.next}" name="next"/>
				</jsp:include>
            </div>


        </div>

        <!--1-2(오른쪽)--> 
        <div class="right" style="position:absolute; left:384px; width: 70%;  height: 100%; background-color: whitesmoke;">
     		<jsp:include page="../../Module/menu/map2.jsp" flush="false"/>
       	</div>

    </div>
 
</body>
<script src="Script/scheduleDeletePlace.js"></script>
</html>