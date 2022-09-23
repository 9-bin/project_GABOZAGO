<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>div_페이지나누기</title>
</head>
<body>
    <!--영역 나누기-->
    <!--영역 안에서 세로로 나누기-->    
    <div style=" width: 100%; height: 100hv; background-color: yellow;">
        <!--1(왼쪽)-->
        <div style="float: left; width: 30%; height: 100hv;background-color: whitesmoke;">
			<!-- 높이 650px / 5 = 130px 영역 나누기 -->
			<!-- 1번 -->
            <div style="float: left; width: 100%; height: 130px;"></div>
			<!-- 2번 -->
            <div style="float: left; width: 100%; height: 130px;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="로그인" style="font-size: 20px; text-align: center;"></td>
                        </tr>

                    </table>
                </form>
            </div>
            <!-- 3번 -->
            <div style="float: left; width: 100%; height: 130px;">
                <h1 span style="border:5px double #DCDCDC; padding: 0.4em; text-align:center">
                    GABOZAGO</span></h1>
            </div>
            <!-- 4번 -->
            <div style="float: left; width: 100%; height: 130px;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="시작하기" style="font-size: 20px; text-align: center;"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            <!-- 5번 -->
            <div style="float: left; width: 100%; height: 130px;"></div>



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