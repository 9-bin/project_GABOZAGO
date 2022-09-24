<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<jsp:include page="menu/menu.jsp" flush="false"/>
			<hr>
			</div>
			<!-- 출발 도착 -->
        	<div class="direction" style="height: 140px;">
        		<div style="height: 200px;">
       				<div class="input-group mb-3" style = "width: 300px; margin: auto;">
 							<input type="text" class="form-control" placeholder="출발지 입력" aria-label="출발지 입력" aria-describedby="basic-addon2">
 							<div class="input-group-append">
   							<button class="btn btn-outline-secondary" type="button">검색</button>
 							</div>
					</div>
       				<div class="input-group mb-3" style = "width: 300px; margin: auto;">
 							<input type="text" class="form-control" placeholder="도착지 입력" aria-label="도착지 입력" aria-describedby="basic-addon2">
 							<div class="input-group-append">
   							<button class="btn btn-outline-secondary" type="button">검색</button>
 							</div>
					</div>
        		</div>
        		<!-- 교통 수단 -->
        		<div style="height: 90px;">
        			<div style="float: left; width: 25%;">
        				<input type="image" src="emoji/car-front-fill.svg" class="btn btn-primary" style="width: 100%;">
        			</div>
        			<div style="float: left; width: 25%;">
        				<input type="image" src="emoji/truck-front-fill.svg" class="btn btn-primary" value="대중교통" style="width: 100%;">
        			</div>
        			<div style="float: left; width: 25%;">
        				<input type="image" src="emoji/bicycle.svg" class="btn btn-primary" value="자전거" style="width: 100%;">
        			</div>
        			<div style="float: left; width: 25%;">
        				<input type="image" src="emoji/universal-access.svg" class="btn btn-primary" value="도보" style="width: 100%;">
        			</div>
        		</div>
        	<div class="info" style="background-color: white;">
        	
        		<!-- info -->
        	</div>
        		<jsp:include page="directions/directions.jsp" flush="false"/>
        
        
        	</div>

		</div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<jsp:include page="menu/map.jsp" flush="false"/>
        </div>

	</div>

</body>
</html>