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
				<jsp:include page="menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
            <!-- 날짜보여주는 부분 -->
            <div style="float: left; width: 100%; height: 40px; margin-top: 20px;">
                &nbsp;<b>Day1</b> &nbsp;2022년 09월 20일  수요일
                <hr>
            </div>
            
            <!-- 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 600px;">
				<!-- 여기다가 목록 보여주기 -->
				<hr>
            </div>
            <div style="height: 25px;">
				<!-- 부트스트랩 활용 페이징네이션 include -->
				<jsp:include page="menu/pagination.jsp" flush="false"/>
            </div>
           


        </div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<jsp:include page="menu/map.jsp" flush="false"/>
        </div>

    </div>
 
</body>
</html>