<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index 페이지</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
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
        <div class="left" style="float: left; width: 30%; height: 100vh;background-color: whitesmoke;">
			<!-- 높이 650px / 5 = 130px 영역 나누기 -->
			<!-- 1번/2번 메뉴 -->
            <div style="float: left; width: 100%; height: 260px;">
				<!-- 부트스트랩 활용 include -->
				<%-- <jsp:include page="Module/menu/menu.jsp" flush="false"/> --%>
                    <hr>
            </div>
  

            <!-- 3번 -->
            <div style="float: left; width: 100%; height: 130px;">
                <h1 span style="border:5px double #DCDCDC; padding: 0.4em; text-align:center">
                    GABOZAGO</span></h1>
            </div>
            <!-- 4번 페이지 이동 "일정"-->
            <div style="float: left; width: 100%; height: 130px;">
                <form action="/login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="시작하기" 
                            onclick="location.href='login.do'"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            <!-- 5번 -->
            <div style="float: left; width: 100%; height: 130px;"></div>


        </div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<img style="width: 100%; height: 100%; id="images" src="/PJ_GABOZAGO/Image/index.png">
        </div>

    </div>
 
</body>
</html>