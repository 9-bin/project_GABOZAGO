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
 	</div>
<!-- 나중에 자바스크립트활용하여 구현 -->
		<!-- 지도영역부분 -->
	<div id="map" style="width:100%; height:100%; float:left; position:absolute; z-index:10;">
	</div>
	<!-- 버튼 -->
</div>

     <script type="text/javascript" 
     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7d3428f35bb9a9deb43f36f2716406"></script>
     <script>
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = { 
             center: new kakao.maps.LatLng(36.450701, 127.570667), // 지도의 중심좌표
             level: 13 // 지도의 확대 레벨
         };


     // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
     var map = new kakao.maps.Map(mapContainer, mapOption); 
     </script>


</body>
</html>