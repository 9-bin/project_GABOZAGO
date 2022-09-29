<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성중인 일정표</title>
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
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
            <!-- 일정 상세 목록 부분 -->
            <div style="float: left; width: 100%; height: 40px; margin-top: 20px;">
                &nbsp;<b>일정1</b> &nbsp;
                <hr>
            </div>
            
            <!-- 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 550px;">
				<br>
				<!-- 여기다가 목록 보여주기 -->
				장소1
				<hr>
				장소2
				<hr>
				장소3
				<hr>
				장소4
				<hr>
            </div>
           
            <!-- 남는공간 -->
            <div style="float: left; width: 100%; height: 50px;"></div>
           <div style="height: 25px;">
				<!-- 부트스트랩 활용 페이징네이션 include -->
				<jsp:include page="../../Module/menu/pagination.jsp" flush="false"/>
            </div>


        </div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
     		<jsp:include page="../../Module/menu/map.jsp" flush="false"/>
       	</div>

    </div>
 
</body>
</html>