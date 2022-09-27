<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
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
	<jsp:include page="../menu/menu.jsp" flush="false"/>
	               <hr>
	</div>
        
            <!-- 가이드 리스트 -->
            <div style="float: left; width: 100%; height: 700px;margin: 20px;">
				<div style="margin: 10px 0 0 10px">
					<input type="checkbox"> 일정에 추가
					<br>
					가이드 리스트1
				</div>
				<br>
				<div style="margin: 10px 0 0 10px">
					<input type="checkbox"> 일정에 추가
					<br>
					가이드 리스트2
				</div>
				<br>				
				<div style="margin: 10px 0 0 10px;">
					<input type="checkbox"> 일정에 추가
					<br>
					가이드 리스트3
				</div>
				<br>				
				<div style="margin: 10px 0 0 10px;">
					<input type="checkbox"> 일정에 추가
					<br>
					가이드 리스트4
				</div>
            </div>
            
            <!-- 페이지네이션 -->
            <div style="position: relative; bottom: 10px;">
				<jsp:include page="../menu/pagination.jsp"></jsp:include>
	        </div>
        </div>

        
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
     		<jsp:include page="../menu/map.jsp" flush="false"/>
       	</div>

    </div>
 
</body>
</html>