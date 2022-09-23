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
		<div class="left" style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
		
			<!-- 메뉴 -->
			<div style="float: left; width: 100%; height: 100px;">
			<!-- 부트스트랩 활용 include -->
			<jsp:include page="menu/menu.jsp" flush="false"/>
			<hr>
			</div>
			<!-- 길찾기 -->
			<!-- 길찾기 전체 height:100px -->
            <div style="width:95%; height:100px; margin: 20px 5px 5px 5px;">		<!--  수정!  -->
	            <div style="float: left; width: 65%; height: 100%; margin-left: 5px">
					<input type="text" placeholder="출발지 입력" style="width:250px; height: 25px; margin-top: 30px;">
					<input type="text"  placeholder="도착지 입력" style="width:250px; height: 25px; margin-top: 5px;">
	    	    </div>		       
	            <div style="float:left; width:80px; height:39px;float: right;">
	                <div>
	                    <input type="button" value="검색" 
	                    style="font-size: 15px; text-align: center; margin-top: 15px; justify-content: flex-start; height: 80px;">
					</div>
	            </div>  
				
            </div>
            
            <!-- 경로 보여주는 부분 -->
            <div style="float: left; width: 100%; height: 335px;">
				<hr><!-- 여기다가 보여주기 -->
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