<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GABOZAGO</title>
</head>
<body>
<!--영역 안에서 세로로 나누기-->    
<div style=" width: 100%; height: 100vh; background-color: yellow;">
    <!--1-1(오른쪽)-->
    <div style="float: left; width: 30%; height: 100vh; 
    background-color: lightslategray;">
    <h1 span style="border:
    5px double #DCDCDC; padding: 0.4em; text-align:center">GABOZAGO</span></h1>
		
		<div style=" width: 50px; height: 20px; background-color: yellow;">
		    <form action="login.do" method="post">
		
		        <input type="submit" value="시작하기" style="font-size: 50px;">
	
	    	</form>
		</div>
    </div>

    <!--1-2(왼쪽)--> 
    <div style="float: right; width: 70%; height: 100vh; 
    background-color: whitesmoke;">
    <div id="map" style="width:100%;height:100vh;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7d3428f35bb9a9deb43f36f2716406"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(36.450701, 127.570667), // 지도의 중심좌표
		        level: 13 // 지도의 확대 레벨
		    };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		</script>

    </div>

</div>

</body>
</html>