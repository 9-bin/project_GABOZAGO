<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교통</title>

</head>

<body>
	<!--영역 나누기-->
	<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
		<!--영역 안에서 세로로 나누기-->    
		<!--1(왼쪽)-->
		<div class="left" style="float: left; width: 384px; height: 100vh; background-color: whitesmoke; border-right: 5px double #DCDCDC;">
			<!-- 메뉴 -->
			<div style="float: left; width: 100%; height: 100px;">
			<!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/searchMenu.jsp" flush="false"/>
				<hr>
			</div>
			
			<!-- 출발 도착 -->
			<div class="direction" style="height: 230px;">
				<form action="trafficNext.do">
					<div class="input-group">
						<select name="local" style="width:70px;">
						  <option ${(local=="0")?"selected":""} value="0">지역</option>
						  <option ${(local=="1")?"selected":""} value=1>강릉</option>
						  <option ${(local=="2")?"selected":""} value=2>부산</option>
						  <option ${(local=="3")?"selected":""} value=3>서울</option>
						  <option ${(local=="4")?"selected":""} value=4>여수</option>
						  <option ${(local=="5")?"selected":""} value=5>제주</option>
						  <option ${(local=="6")?"selected":""} value=6>천안,아산</option>
						</select>
						<select name="placetype" style="width:70px;">
						  <option ${(placetype=="0")?"selected":""} value="0">타입</option>
						  <option ${(placetype=="1")?"selected":""} value=1>관광지</option>
						  <option ${(placetype=="2")?"selected":""} value=2>레포츠</option>
						  <option ${(placetype=="3")?"selected":""} value=3>문화시설</option>
						  <option ${(placetype=="4")?"selected":""} value=4>숙박시설</option>
						  <option ${(placetype=="5")?"selected":""} value=5>음식점</option>
						</select>
						<input type="text" style = "width:190px;" name="keyword" value="${keyword}" aria-label="장소 검색">
						<input type="submit" value="검색">
					</div>
					<input type="text" class="form-control" id="startplace" name="startplace" placeholder="출발지" value="${startplace}"/>
					<input type="text" class="form-control" id="endplace" name="endplace" placeholder="도착지" value="${endplace}"/>
				</form>
			</div>
        		<!-- 교통 수단 -->
       		<div style="height: 110px;">
       			<div style="margin:auto; width: 25%;">
       				<input onclick='newPage()' type="image" src="/PJ_GABOZAGO/Image/direction.png" class="btn btn-primary" value="대중교통" style="width: 100%;">
       			</div>
       		</div>
			<!-- info -->
        	<div class="info" style="background-color: white;">
        		<div style="margin: auto; border:1px solid black; width: 360px; height:60vh;">
					<div style="float: left; width: 100%; height: 100%;margin: auto;">
            			<jsp:include page="../../PAGE/Traffic/trafficResult.jsp"></jsp:include>
            		</div>
				</div>
        	</div>
		</div>

        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
			<%-- <jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
        </div>
	</div>
</body>
<script>
function newPage()  {
	var sp = document.getElementById("startplace"). value;
	var ep = document.getElementById("endplace"). value;
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href = "https://www.google.com/maps/dir/" + sp + "/" + ep;
	}

</script>
</html>