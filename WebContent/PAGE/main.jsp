<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
        <div class="left" style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
			
            <!-- 메뉴 -->
            <div style="float: left; width: 100%; height: 100px;">
                <!-- 부트스트랩 활용 include -->
				<jsp:include page="../Module/menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
            
            <!-- 페이지이동1 "일정"-->
            <div style="float: left; width: 100%; height: 184px; margin-top: 90px;">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="일정" 
                            onclick="location.href='schedule.do'" onmouseover="schedule()" onmouseout="images1()"></td>
                        </tr>
                    </table>
            </div>
            <!-- 페이지이동2 "가이드" -->
            <div style="float: left; width: 100%; height: 184px;">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="가이드" 
                            onclick="location.href='guide.do'" onmouseover="guide()" onmouseout="images1()"></td>
                        </tr>
                    </table>
            </div>
            
            <!-- 페이지이동3 "교통"-->
            <div style="float: left; width: 100%; height: 100px;">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="교통" 
                            onclick="location.href='traffic.do'" onmouseover="traffic()" onmouseout="images1()"></td>
                        </tr>
                    </table>
            </div>
        </div>
        <!--1-2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%;  height: 100vh; background-color: whitesmoke;">
			<img id="images" src="/PJ_GABOZAGO/Image/start.png">
        </div>

    </div>
</body>
<script>
function images1(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/start.png"
}
function schedule(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/schedule.png"
}
function guide(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/guide.png"
}
function traffic(){
	document.getElementById("images").src="/PJ_GABOZAGO/Image/bus.png"
}
</script>
</html>