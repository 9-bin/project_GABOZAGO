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
                &nbsp;<b>일정 plan</b> &nbsp;
                <hr>
            </div>
            <!-- 선택한 장소 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 550px;">
					<table>
					<c:forEach var="product" items="${selectList }">
						<tr>
							<th><input type="checkbox" name="placename" value="${selectList.placename}">장소</th>
							<td>${selectList.adress}</td>
							<td>${selectList.placephone}</td>
							<td><a href="">장소상세</a></td>
						</tr>
						<tr>							<!-- 일정 목록으로 가서 저장되어야 함 -->
							<td><input type="submit" onclick="guidePlanList.do"></td>
						</tr>
					</c:forEach>
					
					</table>
				<hr>
				${message}
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