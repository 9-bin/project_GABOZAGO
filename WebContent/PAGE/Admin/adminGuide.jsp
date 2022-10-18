<%@page import="com.beans.GuideVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

List<GuideVo> list = (List<GuideVo>)request.getAttribute("guideList");

%>
<html>
<head>
<meta charset="UTF-8">
<title>가이드정보관리</title>
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>

<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: whitesmoke;">
    		<!-- 어드민메뉴/로그인 -->
			<jsp:include page="../../Module/menu/adminMenu.jsp" flush="false"/>
            
            <!-- 관리자 상단 선택 영역 탭  -->
            <div style="width: 700px; height: 100px; margin-top: 10px;">
            	<p><span style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid #B2E0F7; 
            	padding: 0.5em; background: #D8EFFB;">가이드정보관리</span></p>
            </div>

        	<!-- 선택창 -->
        	<div id="select" style="width: 700px; height: 150px; margin: auto;">
        		<div> 
        			<select class="form-select" aria-label="Default select example">
					  <option selected>Open this select menu</option>
					  <option value="1">One</option>
					  <option value="2">Two</option>
					  <option value="3">Three</option>
					</select>
        		</div>
        		<div class="input-group mb-3"> <!-- 검색창 -->
				  <input type="text" class="form-control" placeholder="검색하세요" aria-label="검색하세요" aria-describedby="button-addon2">
				  <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
				</div>
        		<div style="float: right;"> <!-- 다운로드 폴더이미지 -->
        			<svg xmlns="http://www.w3.org/2000/svg" width="45" height="40" fill="currentColor" class="bi bi-file-earmark-arrow-down-fill" viewBox="0 0 16 16">
				  		<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zm-1 4v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 0 1 .708-.708L7.5 11.293V7.5a.5.5 0 0 1 1 0z"/>
					</svg></div>
        	
        	<!-- 버튼 -->
        	<form action="deleteGuideOK.do">
        	<div style= "height: 50px;"> 	
	        	<div class="btn-group" style="float: right;">
				  <a href="adminGuideInsert.do" class="btn btn-primary">등록</a>
				</div>
				</div>
        	
        	<!-- 표시될 리스트 영영 -->
        		<div>
        			<table class="tg" >
					<thead>
					  <tr>
					    <th class="tg-c3ow" width="100">장소번호</th>
					    <th class="tg-c3ow" width="50">지역</th>
					    <th class="tg-c3ow" width="150">업체명</th>
					    <th class="tg-c3ow" width="200">주소</th>
					    <th class="tg-c3ow" width="50">종류</th>
					    <th class="tg-c3ow" width="100">삭제</th>
					  </tr>
					</thead>
						<%
							if (list != null) {
								for (GuideVo gVo : list) {
							%>
					<tbody>
					  <tr>
					    <td class="tg-c3ow" width="100" height="50"><div class="form-check">
  							<input type="radio" name= "placenum" value="<%=gVo.getPlacenum() %>">
  							<%=gVo.getPlacenum() %>
						</div></td>
					    <td class="tg-c3ow" width="50" height="50"><%=gVo.getLocal() %></td>
					    <td class="tg-c3ow" width="150" height="50"><%=gVo.getPlacename() %></td>
					    <td class="tg-c3ow" width="200" height="50"><%=gVo.getAdress() %></td>
					    <td class="tg-c3ow" width="50" height="50"> <%=gVo.getPlacetype() %></td>
					    <td class="tg-c3ow" width="100" height="50" >
					    <input type="submit" value="삭제"></td>
					  </tr>
					</tbody>
						<%
								}
							}
							%>
				</table>
        		</div>
        		</form>
        		<br>
        	<jsp:include page="./adminGuideAllPaging.jsp" flush = "false">
			<jsp:param value="${paging.page}" name="page"/>
			<jsp:param value="${paging.beginPage}" name="beginPage"/>
			<jsp:param value="${paging.endPage}" name="endPage"/>
			<jsp:param value="${paging.prev}" name="prev"/>
			<jsp:param value="${paging.next}" name="next"/>
			</jsp:include>
    </div>
   </div>
</body>
</html>
