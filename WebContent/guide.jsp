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
	<jsp:include page="menu/menu.jsp" flush="false"/>
	               <hr>
	</div>
        
            <!-- 가이드 리스트 -->
            <div style="float: left; width: 100%; height: 440px;margin: 20px;">
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
            

        </div>
        
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
        	<!-- 공유하기 -->
        	<div style="width:100%;height:10%;" >
        		 <!-- 나중에 자바스크립트활용하여 구현 -->
	             <input type="button" value="공유하기" onclick="alert('로그인해주세요')" style="cursor:pointer; float: right;">
	             <input type="button" value="커뮤니티" onclick="alert('로그인해주세요')" style="cursor:pointer; float: right;">
                            
        	</div>
			<!-- 지도영역부분 -->
            <div id="map" style="width:100%;height:90%;"></div>

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
        	</div>

    </div>
 
</body>
</html>