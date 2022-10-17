<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
	<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
	<!--영역 안에서 세로로 나누기-->    
	   <!--1(왼쪽)-->
	   <div class="left" style="float: left; width: 384px; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
	

	           <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
	               <hr>

        
            <!-- 가이드 리스트 -->

            <div style="float: left; width: 100%; height: 700px;margin: 20px;">
            <form action="guideSearch.do?local=${local}&placetype=${placetype}&keyword=${keyword}">
						<table style="border-collapse: collapse;">
							<tr>
					         	<td>
					         		<select name="local">
							         	<option ${(local=="0")?"selected":""} value="0">지역</option>
										<option ${(local=="1")?"selected":""} value="1">강릉</option>
										<option ${(local=="2")?"selected":""} value="2">부산</option>
										<option ${(local=="3")?"selected":""} value="3">서울</option>
										<option ${(local=="4")?"selected":""} value="4">여수</option>
										<option ${(local=="5")?"selected":""} value="5">제주</option>
										<option ${(local=="6")?"selected":""} value="6">천안,아산</option>
									</select>
								</td>
								<td><select name="placetype">
					         		<option ${(placetype=="0")?"selected":""} value="0">타입</option>
					         		<option ${(placetype=="1")?"selected":""} value="1">관광지</option>
					         		<option ${(placetype=="2")?"selected":""} value="2">레포츠</option>
									<option ${(placetype=="3")?"selected":""} value="3">문화시설</option>
									<option ${(placetype=="4")?"selected":""} value="4">숙박시설</option>
									<option ${(placetype=="5")?"selected":""} value="5">음식점</option>
								</select></td>
								<td><input style="width:100px;" type="text" name="keyword" value="${keyword}" placeholder="장소이름"></td>
								<td>
									<button type="submit">검색</button>
								</td>
							</tr>
						</table>
					</form>
            		<jsp:include page="../../PAGE/Guide/guideList.jsp"></jsp:include>
            </div>

            

        </div>

        
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
     		<%-- <jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
       	</div>

    </div>
 
</body>
</html>