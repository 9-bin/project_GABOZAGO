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
	   <div class="left" style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
	

	           <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
	               <hr>

        
            <!-- 가이드 리스트 -->
            <div style="float: left; width: 100%; height: 700px;margin: 20px;">
           		<table>
					<tr>
						<th>일정 추가</th>
						<th>이름</th>
						<th>주소</th>
					</tr>
					<%
					if (list != null) {
						for (GuideVo gVo : list) {
					%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%=gVo.getPlacename() %></td>
							<td><%=gVo.getAdress()%></td>
				
						</tr>
				
					<%
				
						}
					}
					%>
				</table>
				${local}
				<%-- <% System.out.println(); %> --%>
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
     		<jsp:include page="../../Module/menu/map.jsp" flush="false"/>
       	</div>

    </div>
 
</body>
</html>