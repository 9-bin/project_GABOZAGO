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
table, th, td{
   border: 1px solid black;
   border-collapse: collapse;
   text-align: center;
}
table{
   width: 90%;
}
/* 테이블 스크롤바 */
#scrollBar { 
  overflow-y: scroll;
}
#scrollBar::-webkit-scrollbar {
    width: 1px;  /* 스크롤바의 너비 */
}

#scrollBar::-webkit-scrollbar-thumb {
    height: 2px; /* 스크롤바의 길이 */
    background: #B2CCFF; /* 스크롤바의 색상 */
    border-radius: 10px;
}
#scrollBar::-webkit-scrollbar-track {
    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
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
					<form action="guideAllSearch.do?guideSearch=${guideSearch}">
						<div> 
        			<select name="guideSearch" class="form-select" aria-label="Default select example">
	         		<option value="0" selected="selected">유형선택</option>
	         		<option value="1">관광지</option>
	         		<option value="2">레포츠</option>
					<option value="3">문화시설</option>
					<option value="4">숙박시설</option>
					<option value="5">음식점</option>
					</select>
        		</div>
        		<div class="input-group mb-3"> <!-- 검색창 -->
				  <input type="text" name="guideKeyword" placeholder="검색하세요" class="form-control" aria-label="검색하세요" aria-describedby="button-addon2">
				  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
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
								<th>일정추가</th>
								<th>이름</th>
								<th>주소</th>
							</tr>
							<%
							if (list != null) {
								for (GuideVo gVo : list) {
							%>
							<tr>
								<td><input type="radio" name="placenum" value="<%=gVo.getPlacenum() %>"><%=gVo.getPlacenum() %></td>
								<td><%=gVo.getPlacename() %></td>
								<td><%=gVo.getAdress()%></td>
							</tr>
							<%
						
								}
							}
							%>
						</table>
					</form>
				</div>
				<jsp:include page="./gaPaging.jsp" flush = "false">
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