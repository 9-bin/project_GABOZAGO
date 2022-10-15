<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.beans.ScheduleVo"%>
<%
List<ScheduleVo> list = (List<ScheduleVo>) request.getAttribute("scheduleList");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정생성하기</title>
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
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
                <hr>
            </div>
            <!-- 새일정 만들기 -->
            <div style="float: left; width: 100%; height: 150px; margin-top: 20px;">
            	<button type="submit" class="btn btn-outline btn-primary pull-right" id="selectBtn" style="float: right">여행만들기</button><br><br>
                <form action="scheduleNext.do" method="post">
					<input type="text" placeholder="일정 이름" name="schedulename">
                	<input type="submit" value="+ 새 일정 만들기" style="font-size: 20px; text-align: center;">
                </form>
            </div>
                        <!-- 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 550px;">
				<table id="example-table-3" width="100%" class="table table-bordered table-hover text-center">
	<tr>
		<th>일정명</th>
	</tr>
	<%
	if (list != null) {
		for (ScheduleVo sVo : list) {
			int a = 1;
	%>
		<tr>
			<td><a href="scheduleNext.do?schedulename=<%=sVo.getSchedulename()%>"><%=sVo.getSchedulename()%></a></td>
		</tr>
	<%
		a+=1;
		}
	}
	%>
</table>
<jsp:include page="./listPaging.jsp" flush = "false">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
        </div>
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
     		<%-- <jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
       	</div>

    </div>

</body>
</html>