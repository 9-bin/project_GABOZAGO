<%@page import="com.beans.MemberVo"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<MemberVo> list = (List<MemberVo>) request.getAttribute("memberList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>

<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: whitesmoke;">
    		<!-- 어드민메뉴/로그인 -->
    		<div style="float: left; background-color: whitesmoke;">
			<jsp:include page="../../Module/menu/adminMenu.jsp" flush="false"/>
			</div>
            
            
            <div style="width: 700px; height: 100px; margin: auto;">
            	<p><span style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid #B2E0F7; 
            	padding: 0.5em; background: #D8EFFB;">회원관리</span></p>
            </div>

        	<!-- 관리자 상단 선택 영역 탭  -->
        	<div id="select" style="width: 700px; height: 150px; margin: auto;">
        		<!-- 선택창 -->
        		<form action="memberSearch.do" method="post">
        			<div> 
	        			<select class="form-select" aria-label="관리자 페이지 회원 관리" name="searchMember">
						    <option selected>검색할 항목 선택</option>
						    <option value="name">이름</option>
			  			    <option value="email">이메일</option>
						    <option value="userid">아이디</option>
						</select>
	        		</div>
	        		<div class="input-group mb-3"> <!-- 검색창 -->
					  <input type="text" class="form-control" placeholder="검색하세요" aria-label="검색하세요" 
					  aria-describedby="button-addon2" name="memberKeyword">
					  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					</div>
				</form>
        	
        	<!-- 버튼이 있었던..영역.. -->
        	<div style= "height: 50px;">

			</div>
        	
        	<!-- 표시될 리스트 영역 -->
        		<div>
        			<table class="tg" style="margin: auto;">
					<thead>
					  <tr>
					    <th class="tg-c3ow">no</th>
					    <th class="tg-c3ow">id</th>
					    <th class="tg-c3ow">name</th>
					    <th class="tg-c3ow">phone</th>
					    <th class="tg-c3ow">email</th>
					    <th class="tg-c3ow">gender</th>
					    <th class="tg-c3ow">admin</th>
					  </tr>
					</thead>
					<% if (list != null) {
					         for (MemberVo mVo : list) {
				      %>
					<tbody>
					  <tr>
					    <td class="tg-c3ow" width="70"><%= mVo.getUserno() %></td>
					    <td class="tg-c3ow" width="150"><a href="userInfo.do?id=<%=mVo.getUserid() %> "><%=mVo.getUserid() %></a></td>
					    <td class="tg-c3ow" width="150"><%= mVo.getName() %></td>
					    <td class="tg-c3ow" width="200"><%= mVo.getPhone() %></td>
					    <td class="tg-c3ow" width="150"><%= mVo.getEmail() %></td>
					    <td class="tg-c3ow" width="150"><%= mVo.getGender() %></td>
					    <td class="tg-c3ow" width="150"><%= mVo.getAdmin() %></td>
					  </tr>
					<%
         					}
      					}
      				%>

					</tbody>
				</table>
        		
        		</div>
        	<div>
		<jsp:include page="/Module/menu/Paging.jsp">
		<jsp:param value="${paging.page}" name="page"/>
		<jsp:param value="${paging.beginPage}" name="beginPage"/>
		<jsp:param value="${paging.endPage}" name="endPage"/>
		<jsp:param value="${paging.prev}" name="prev"/>
		<jsp:param value="${paging.next}" name="next"/>
		</jsp:include>
	</div>
	</div>

</div>




    
</body>
</html>
