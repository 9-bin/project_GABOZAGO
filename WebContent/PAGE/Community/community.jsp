<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/login.js"></script>
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
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
        
            
            <!-- 목록 보여주기 -->
            <div><!-- 여기다가 목록 보여주기 -->
				<!-- 메뉴 내부 항목 -->
                <div class="offcanvas-body small">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="plan.do">속초</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="traffic.do">강릉</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >여수</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >부산</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >충청도</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >수도권</a>
                        </li>
                    
                    </ul>
                </div>
            </div>
        </div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<!-- 지도영역부분 -->
            <div id="map" style="width:100%;height:100%;"></div>

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