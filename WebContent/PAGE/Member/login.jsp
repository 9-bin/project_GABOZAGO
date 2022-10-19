<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<link href="" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>GABOZAGO</title>
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
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 100%; height: 100vh;background-color: whitesmoke;">
        <div style="margin: auto; background-color: whitesmoke; width: 50%;" >
        <!-- 메뉴 -->
        <jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
       
    
		<!-- 로그인 TEXT 영역 -->	
        <form action="loginOK.do">
            <div style="margin: 100px 15px 5px 15px; height: 50px;">
                <h1 span style="border-bottom: 3px solid steelblue"> &nbsp 로그인</h1>
            </div>  
            <!-- 로그인 입력창 영역 -->	
            <div style="width:95%; height:200px; margin: 20px 5px 5px 5px;">		<!--  수정!  -->
	            <div style="float: left; width: 65%; height: 100%; margin: 25px 0 0 8px">
	            	<div class="input-group mb-3" style="margin-top: 20px;">
                        <span class="input-group-text" id="" basic-addon1">아이디</span>
                        <input type="text" class="form-control" name="userid" placeholder="아이디" aria-label="아이디"
                            aria-describedby="basic-addon1" >
                    </div>
                    <div class="input-group mb-3" style="margin-top: 20px;">
                        <span class="input-group-text" id="" basic-addon1">비밀번호</span>
                        <input type="password" class="form-control" name="password" placeholder="비밀번호" aria-label="비밀번호"
                            aria-describedby="basic-addon1">
                    </div>
	            
	    	    </div>
	    	    <!-- 회원가입 링크부분 -->		       
	            <div style="float:left; width:80px; height:30px;float: right;">
	                <a href="join.do" style="width: 50px;">회원가입</a>
	                <!-- 로그인 버튼 영역 -->
	                <div>
	                    <input class="w-btn w-btn-gra1 w-btn-gra-anim" type="submit" value="로그인"
	                    style="font-size: 15px; text-align: center; margin-top: 20px; justify-content: flex-start; height: 110px;">
					</div>
	            </div>  

            </div>
        
        </form>
		</div>
   		</div>
    
<%--         <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<jsp:include page="../../Module/menu/map.jsp" flush="false"/>
   		</div> --%>
</div>

</body>
</html>
