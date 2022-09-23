<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케쥴 뉘누기야</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 30%; height: 100vh;background-color: lightslategray;">

			<!-- 로그인부분 -->
            <div style="float: left; width: 100%; height: 50px;background-color:lightslategray;">
                <form action="login.do" method="post">
                    <table>
                        <tr>
                            <td><input type="submit" value="로그인" style="font-size: 20px; text-align: center;"
                            onclick="location.href='login.jsp'"></td>
                        </tr>

                    </table>
                </form>
            </div>
            <!-- 가보자고 시작페이지 링크 넣어주기 -->
            <div style="float: left; width: 100%; height: 50px;background-color:lightslategray;">
                <h1 span style="border:5px double #DCDCDC; padding: 0.4em; text-align:center; font-size: 10px;">
                    GABOZAGO</h1>
            </div>
            <!-- 일정생성//가이드/교통 영역나눠서 테이블로 버튼생성 -->
            <div style="float: left; width: 100%; height: 37.5px;background-color:lightslategray;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="일정생성" style="font-size: 20px; text-align: center;"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            <div style="float: left; width: 100%; height: 37.5px;background-color:lightslategray;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="가이드" style="font-size: 20px; text-align: center;"></td>
                            <td><input type="submit" value="교통" style="font-size: 20px; text-align: center;"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <!-- 날짜보여주는 부분 -->
            <div style="float: left; width: 100%; height: 40px;background-color:lightslategray; margin-top: 20px;">
                &nbsp;<b>Day1</b> &nbsp;2022년 09월 20일  수요일
                <hr>
            </div>
            
            <!-- 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 400px;background-color:lightslategray;">
				<!-- 여기다가 목록 보여주기 -->
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