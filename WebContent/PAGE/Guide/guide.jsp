<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
<link href="/css/button.css" rel="stylesheet" type="text/css">
</head>
<style>
@charset "UTF-8";
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

/* 페이지 전체화면 설정 */
body {
  margin: 0;
}
.container {
/* vw, vh는 뷰포트의 길이에 영향 (뷰포트란 해당 웹페이지를 실행하고 있는 기기의 화면크기) */
  width: 100vw;
  height: 100vh;
}

/* memberadmin 표 */
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}


.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}


.w-btn:active {
    transform: scale(1.5);
}


.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}


.w-btn-gra-anim {
    background-size: 400% 400%;
    animation: gradient1 5s ease infinite;
}

@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}

</style>
<body>
<!--영역 나누기-->
<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
	<!--영역 안에서 세로로 나누기-->
	<!--1(왼쪽)-->
	<div class="left"
		style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">


		<!-- 부트스트랩 활용 include -->
		<jsp:include page="../../Module/menu/menu.jsp" flush="false" />
		<hr>


		<!-- 가이드 리스트 -->
		<div>${local} ${local} ${local}</div>
		
		<div style="float: left; width: 100%; height: 700px;margin: 20px; text-align: center;">
			<input class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="전체 목록" onclick="location.href='guideAll.do'"><br><br><br>
			<form action="guideNext.do" method="post">
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="1" name="local">강원도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="2" name="local">경상도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="3" name="local">수도권</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="4" name="local">전라도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="5" name="local">제주도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="6" name="local">충청도</button> 
			</form>
		</div>
	</div>


	<!--2(오른쪽)-->
	<div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
            <div id="map" style="width:100%;height:100%;"></div>

                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7d3428f35bb9a9deb43f36f2716406"></script>
                <script>ms 
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