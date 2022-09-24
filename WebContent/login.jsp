<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<link href="" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>GABOZAGO</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 30%; height: 100vh;background-color: whitesmoke;">
        <!-- 메뉴 -->
        <jsp:include page="menu/menu.jsp" flush="false"/>
       
    
		<!-- 로그인 TEXT 영역 -->	
        <form action="login.do" method="post">
            <div style="margin: 100px 15px 5px 15px; height: 50px;">
                <h1 span style="border-bottom: 3px solid steelblue"> &nbsp 로그인</h1>
            </div>  
            <!-- 로그인 입력창 영역 -->	
            <div style="width:95%; height:200px; margin: 20px 5px 5px 5px;">		<!--  수정!  -->
	            <div style="float: left; width: 65%; height: 100%; margin-left: 5px">
					<input type="text" name="userid" style="height: 25px; margin-top: 30%;">
					<input type="password" name="userpwd" style="height: 25px; margin-top: 5px;">
	    	    </div>
	    	    <!-- 회원가입 링크부분 -->		       
	            <div style="float:left; width:80px; height:39px;float: right;">
	                <a href="join.jsp" style="width: 50px;">회원가입</a>
	                <!-- 로그인 버튼 영역 -->
	                <div>
	                    <input type="submit" value="로그인" 
	                    style="font-size: 15px; text-align: center; margin-top: 20px; justify-content: flex-start; height: 110px;">
					</div>
	            </div>  

            </div>
        
        </form>

   		</div>
    
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<jsp:include page="menu/map.jsp" flush="false"/>
   		</div>
</div>

</body>
</html>
