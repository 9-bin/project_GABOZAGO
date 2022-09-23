<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index 페이지</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 30%; height: 100vh;background-color: whitesmoke;">
			<!-- 높이 650px / 5 = 130px 영역 나누기 -->
			<!-- 1번/2번 메뉴 -->
            <div style="float: left; width: 100%; height: 260px;">
				<!-- 부트스트랩 활용 include -->
				<jsp:include page="menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
            

            <!-- 3번 -->
            <div style="float: left; width: 100%; height: 130px;">
                <h1 span style="border:5px double #DCDCDC; padding: 0.4em; text-align:center">
                    GABOZAGO</span></h1>
            </div>
            <!-- 4번 페이지 이동 "일정"-->
            <div style="float: left; width: 100%; height: 130px;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="button" value="시작하기" style="font-size: 20px; text-align: center;"
                            onclick="location.href='paln1.jsp'"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            <!-- 5번 -->
            <div style="float: left; width: 100%; height: 130px;"></div>


        </div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">

            <div id="map" style="width:100%;height:100%;"></div>

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