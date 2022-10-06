<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%
List<GuideVo> list = (List<GuideVo>) request.getAttribute("guideList");

String [] places = request.getParameterValues("place");

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성중인 일정표</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
			
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
				<form action="plan.do" method="get">
				<!-- 일정 상세 목록 부분 -->
	            <div style="float: left; width: 100%; height: 40px;">
	                &nbsp;<b>일정 plan</b> &nbsp;&nbsp;
	                <button type="submit" class="btn btn-outline btn-primary pull-right" id="selectBtn" style="float: right;">여행만들기</button>
	                <hr>
	                <br><br>
	            </div>
				
				<table id="example-table-3" width="90%" class="table table-bordered table-hover text-center">
					<tr>
						<!-- <th>일정 추가</th> -->
						<th>이름/주소</th>
						<!-- <th>주소</th> -->
					</tr>
					<%
					if (places != null) {
						for (String place : places) {
					%>
						<tr>
							<td><%=place%></td>
							<%-- <td><%=place %></td> --%>
							<%-- <td><input type="checkbox" name="place" value="<%=place%>"><%=place%></td> --%>
				
						</tr>
				
					<%
				
						}
					}
					%>
				</table>
				</form>
				</div>
				${local}
				<%-- <% System.out.println(); %> --%>
				<jsp:include page="../Guide/grPaging.jsp" flush = "false">
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