<%@page import="com.beans.MemberVo"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 String userid = (String)request.getAttribute("id");
 request.setAttribute("id", userid);
/*  System.out.println("adminUserUpdate.jsp : " + userid); */
 List<MemberVo> list = (List<MemberVo>) request.getAttribute("mVo");
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
            	<p style="height: 0px;">
            	<span style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid #B2E0F7; 
            	padding: 0.5em; background: #D8EFFB; ">회원관리</span></p>
            </div>

        	<!-- 관리자 상단 선택 영역 탭  -->
        	<div id="select" style="width: 700px; height: 150px; margin: auto;">
        	
        	<!-- 버튼 -->
        	<form action="adminUpdateOK.do" name="frm" onsubmit="return check(this)">
        		<div>
	        	<div style= "height: 50px;">
		        	<div class="btn-group" style="float: right;">
		        		<a>
					  		<input type="submit" class="btn btn-primary" value="확인">
					  	</a>
					  	<a>
					  		<input type="reset" class="btn btn-primary" value="원상태로">
					  	</a>
					</div>
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
					 /*        	 System.out.print("id : " + mVo.getUserid() + " |  name : " + mVo.getName()); */
				      %>
					<tbody>
					  <tr>
					    <td class="tg-c3ow" width="50"><%= mVo.getUserno() %></td>
					    <td class="tg-c3ow" width="150">
					   		<input type="text" value="<%=mVo.getUserid() %>" name="Userid" style="width: 50px;" readonly="readonly">
					   	</td>
					    <td class="tg-c3ow" width="150">
					    	<input type="text" value="<%= mVo.getName() %>" name="Name" style="width: 80px;">
					    </td>
					    <td class="tg-c3ow" width="200">
					    	<input type="text" value="<%= mVo.getPhone() %>" name="Phone" style="width: 150px;">
					    </td>
					    <td class="tg-c3ow" width="150">
					    	<input type="text" value="<%= mVo.getEmail() %>" name="Email" style="width: 100px;">
					    </td>
					    <td class="tg-c3ow" width="150">
					    	<select name = "ch_gender">
					    		<option value="<%= mVo.getGender()%>" selected="selected">기본 - <%= mVo.getGender() %></option>
					    		<option value="0">남자</option>					    		
					    		<option value="1">여자</option>
					    	</select> 
					    </td>
					    <td class="tg-c3ow" width="150">
					    	<select name = "ch_admin">
					    		<option value="<%= mVo.getAdmin()%>" selected="selected">기본 - <%= mVo.getAdmin()%></option>
					    		<option value="0">일반회원</option>
					    		<option value="1">관리자</option>
					    	</select> 
					    </td>
					  </tr>
					<%
         					}
      					}
      				%>

					</tbody>
				</table>
        		
        		</div>
        		</div>
        	</form>

	</div>

</div>

</body>
</html>
