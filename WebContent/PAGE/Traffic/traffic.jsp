<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GABOZAGO</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--영역 나누기-->
	<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
		<!--영역 안에서 세로로 나누기-->    
		<!--1(왼쪽)-->
		<div class="left" style="float: left; width: 30%; height: 100vh; background-color: whitesmoke; border-right: 5px double #DCDCDC;">
			<!-- 메뉴 -->
			<div style="float: left; width: 100%; height: 100px;">
			<!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
				<hr>
			</div>
			
			<!-- 출발 도착 -->
			<div class="direction" style="height: 230px;">
				<div class="input-group">
					<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">필터</button>
						<ul class="dropdown-menu">
				    		<li><a class="dropdown-item" href="#">장소명</a></li>
				    		<li><a class="dropdown-item" href="#">지역</a></li>
				  		</ul>
					<input type="text" class="form-control" placeholder="장소 검색" aria-label="장소 검색" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
				</div>
				<input type="text" class="form-control" placeholder="출발지" aria-label="출발지" aria-describedby="button-addon2">
				<input type="text" class="form-control" placeholder="도착지" aria-label="도착지" aria-describedby="button-addon2">
			</div>
        		<!-- 교통 수단 -->
       		<div style="height: 90px;">
       			<div style="float: left; width: 25%;">
       				<input type="image" src="/PJ_GABOZAGO/Image/car-front-fill.svg" class="btn btn-primary" style="width: 100%;">
       			</div>
       			<div style="float: left; width: 25%;">
       				<input type="image" src="/PJ_GABOZAGO/Image/truck-front-fill.svg" class="btn btn-primary" value="대중교통" style="width: 100%;">
       			</div>
       			<div style="float: left; width: 25%;">
       				<input type="image" src="/PJ_GABOZAGO/Image/bicycle.svg" class="btn btn-primary" value="자전거" style="width: 100%;">
       			</div>
       			<div style="float: left; width: 25%;">
       				<input type="image" src="/PJ_GABOZAGO/Image/universal-access.svg" class="btn btn-primary" value="도보" style="width: 100%;">
       			</div>
       		</div>
			<!-- info -->
        	<div class="info" style="background-color: white;">
        		<div style="margin: auto; border:1px solid black; width: 360px; height:67vh;">
					<div style="float: left; width: 100%; height: 700px;margin: auto;">
            			<jsp:include page="../../PAGE/Traffic/trafficResult.jsp"></jsp:include>
            		</div>
				</div>
        	</div>
		</div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<jsp:include page="../../Module/menu/map.jsp" flush="false"/>
        </div>
	</div>
</body>
</html>