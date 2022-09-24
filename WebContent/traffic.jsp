<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GABOZAGO</title>
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
			<!-- 길찾기 -->
			<!-- 길찾기 전체 height:100px -->
            <div style="width:95%; height:100px; margin: 20px 5px 5px 5px;">		<!--  수정!  -->
	            <div style="float: left; width: 65%; height: 100%; margin-left: 5px">
					<input type="text" placeholder="출발지 입력" style="width:250px; height: 25px; margin-top: 30px;">
					<input type="text"  placeholder="도착지 입력" style="width:250px; height: 25px; margin-top: 5px;">
	    	    </div>		       
	            <div style="float:left; width:80px; height:39px;float: right;">
	                <div>
	                    <input type="button" value="검색" 
	                    style="font-size: 15px; text-align: center; margin-top: 15px; justify-content: flex-start; height: 80px;">
					</div>
	            </div>  
				
            </div>
            
            <!-- 경로 보여주는 부분 -->
            <div style="float: left; width: 100%; height: 335px;">
				<hr><!-- 여기다가 보여주기 -->
            </div>

		</div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<jsp:include page="menu/map.jsp" flush="false"/>
        </div>

	</div>

</body>
</html>