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
<title>가이드정보관리받아</title>
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>

<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: whitesmoke;">
    		<!-- 어드민메뉴/로그인 -->
			<div style="float: left; background-color: whitesmoke;">
			<jsp:include page="../../Module/menu/adminMenu.jsp" flush="false"/>
            </div>
            
            <!-- 관리자 상단 선택 영역 탭  -->
            <div style="width: 700px; height: 10px;"></div> 
            <div style="width: 700px; height: 100px; margin: auto;">
            	<p><span style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid #B2E0F7; 
            	padding: 0.5em; background: #D8EFFB;">가이드정보관리</span></p>
            </div>

        	<!-- 선택창 -->
        	<div id="select" style="width: 700px; height: 150px; margin: auto;">
        	        		<form action="adminGuideSearch.do" method="post">
        			<div class="input-group mb-3"> 
        			 	<label class="input-group-text" for="inputGroupSelect01">지역</label>
	        			<select class="form-select" name="local" 
	        				aria-label="Floating label select example">
                                    <option value="1" selected>강원도</option>
                                    <option value="2">경상도</option>
                                    <option value="3">수도권</option>
                                    <option value="4">전라도</option>
                                    <option value="5">제주도</option>
                                    <option value="6">충청도</option>
                        </select>
                        <label class="input-group-text" for="inputGroupSelect01">타입</label>
						<select class="form-select"  name="placetype" 
							aria-label="Floating label select example">
                                    <option value="1" selected>관광지</option>
                                    <option value="2">레포츠</option>
                                    <option value="3">문화시설</option>
                                    <option value="4">숙박시설</option>
                                    <option value="5">음식점</option>
                        </select>
					</div>
					
	        		<div class="input-group mb-3"> <!-- 검색창 -->
					  <input type="text" class="form-control" placeholder="검색하세요" aria-label="검색하세요" 
					  aria-describedby="button-addon2" name="adminkeword">
					  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					</div>
				</form>
			
        	
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
					    <th class="tg-c3ow" width="250">주소</th>
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
  							<input type="text" name= "placenum" readonly="readonly"  style="border:0; width:50px; background-color: whitesmoke; "
  							value="<%=gVo.getPlacenum() %>">
						</div></td>
					    <td class="tg-c3ow" width="50" height="50"><%=gVo.getLocal() %></td>
					    <td class="tg-c3ow" width="150" height="50"><%=gVo.getPlacename() %></td>
					    <td class="tg-c3ow" width="250" height="50"><%=gVo.getAdress() %></td>
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
        	<jsp:include page="./adminGuideSearchPaging.jsp" flush = "false">
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
