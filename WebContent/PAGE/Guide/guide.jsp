<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
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
    <div class="view" style=" width: 100vw; height: 100vh; background-color:whitesmoke">
	<!--영역 안에서 세로로 나누기-->
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 384px; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">


		<!-- 부트스트랩 활용 include -->
		<jsp:include page="../../Module/menu/menu.jsp" flush="false" />
		<hr>


		<!-- 가이드 리스트 -->		
		<div style="float: left; width: 100%; height: 700px;margin: 20px; text-align: center;">
			<input class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="전체 목록" onclick="location.href='guideAll.do'"
			onmouseover="guide_1()" onmouseout="images1()"><br><br><br>
			<form action="guideNext.do">
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="1" name="local"
				onmouseover="guide_2()" onmouseout="images1()">강원도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="2" name="local"
				onmouseover="guide_3()" onmouseout="images1()">경상도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="3" name="local"
				onmouseover="guide_4()" onmouseout="images1()">수도권</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="4" name="local"
				onmouseover="guide_5()" onmouseout="images1()">전라도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="5" name="local"
				onmouseover="guide_6()" onmouseout="images1()">제주도</button> <br><br><br>
				<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="6" name="local"
				onmouseover="guide_7()" onmouseout="images1()">충청도</button> 
			</form>
		</div>
		<input type="hidden" id="markerLat" value="36.1676050697">
		<input type="hidden" id="markerLon" value="128.0824067374">
	</div>


    <!--1-2(오른쪽)--> 
    <div class="right" style="position:absolute; left:384px; width: 70%;  height: 100%; background-color: whitesmoke;">
		<img id="images" src="/PJ_GABOZAGO/Image/guide_1.png">
    </div>

</div>

 
</body>
<script>
function images1(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_1.png"
}
function guide_2(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_2.png"
}
function guide_3(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_3.png"
}
function guide_4(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_4.png"
}
function guide_5(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_5.png"
}
function guide_6(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_6.png"
}
function guide_7(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_7.png"
}
function guide_8(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide_8.png"
}

</script>

</html>