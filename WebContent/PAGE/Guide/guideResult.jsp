<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%
List<GuideVo> list = (List<GuideVo>)request.getAttribute("guideList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
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
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
	<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
	<!--영역 안에서 세로로 나누기-->    
	   <!--1(왼쪽)-->
	   <div class="left" style="float: left; width: 384px; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
	

	           <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
	               <hr>

        
            <!-- 가이드 리스트 -->
            <div style="float: left; width: 100%; height: 700px;margin: 20px;">
            	<input type="hidden" id="markerLat" value="36.1676050697">
				<input type="hidden" id="markerLon" value="128.0824067374">
				<input type="hidden" id="pn" value="">
           		<div class="row" style="width: 90%">
				<form action="guideSearch.do?guideSearch=${guideSearch}&guideKeyword=${guideKeyword}">
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
           						<input type="text" placeholder="검색어 입력" name="guideKeyword" maxlength="100">
           					</td>
           					<td>
           						<button type="submit">검색</button>
           					</td>
           				</tr>
           			</table>
           		</form>
				<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
					<tr>
						<th>장소번호</th>
						<th>이름</th>
						<th>주소</th>
					</tr>
					<%
					if (list != null) {
						int a = 1;
						for (GuideVo gVo : list) {
					%>
						<tr>
							<td onclick="marking<%=a%>()"><%=gVo.getPlacenum() %><input type="hidden" id="Latitude<%=a%>" value="<%=gVo.getLatitude()%>"> <input type="hidden" id="Longtiude<%=a%>" value="<%=gVo.getLongtiude()%>"></td>
							<td onclick="marking<%=a%>()"><%=gVo.getPlacename() %><input type="hidden" id="<%=a%>" value="<%=gVo.getPlacename() %>"></td>
							<td><%=gVo.getAdress()%></td>
				
						</tr>
				
					<%
						a+=1;
						}
					}
					%>
				</table>
				</div>
				<%-- ${local} 디버깅 --%>
				<jsp:include page="./grPaging.jsp" flush = "false">
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
</html>