<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오른쪽 지도 영역</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<!-- 공유하기 -->
<div style="width:100%;height:100%; float: right; position: relative;">
 	<div style="cursor:pointer; float: right; padding:5px; height:5%; width:70px; position:absolute; z-index:100; right: 2%;">
   		<input type="button" value="공유하기" onclick="alert('로그인해주세요')">
		<input type="hidden" id="markerLat" value="36.1676050697">
		<input type="hidden" id="markerLon" value="128.0824067374">
		<input type="hidden" id="pn" value="">      
 	</div>
<!-- 나중에 자바스크립트활용하여 구현 -->
		<!-- 지도영역부분 -->
	<div id="map" style="width:100%; height:100%; float:left; position:absolute; z-index:10;">
	</div>
	
	<!-- 버튼 -->
</div>

</body>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDH6jkkm5M6hIzD1nfdI6A3A1sr1wxcRGo&callback=initMap&region=kr"></script>
	<script src="Script/map.js"></script>
</html>