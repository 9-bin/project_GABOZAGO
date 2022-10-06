<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정생성하기</title>
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
            <!-- 새일정 만들기 -->
            <div style="float: left; width: 100%; height: 40px; margin-top: 20px;">
                <form action="guide.do">
                    <table>
                        <tr>
                            <td><input type="submit" value="+ 새 일정 만들기" style="font-size: 20px; text-align: center;"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <!-- 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 550px;">
				<br>
				<!-- 생성된 일정 목록 보여주기 -->
				<form action="guide.do" method="post">
						<table>
						<c:forEach var="plan" items="${planList}">	 <!-- 정의 안함 일단 써둔거 -->
							<tr>
								<th>
									<input type="checkbox" name="planNum" value="${planList}">
									<a href="writePlan.jsp">일정</a>
								</th>
				
						</tr>
						<!-- 생성된 일정 목록 보여주기 -->
							<tr>
								<td>${planList.placename}</td>
							</tr>
						</c:forEach>
						<th>
						   <input type="hidden" value="planNum">
						   <input type="submit" value="등록">
						   <input type="reset" value="취소">
						</th>
						</table>
						<hr>
				</form>
            </div>           
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