<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 화면</title>
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
				<jsp:include page="../Module/menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
            <!-- 페이지이동1 "가이드" -->
            <div style="float: left; width: 100%; height: 184px;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="가이드" style="margin-top:75px; font-size: 20px; text-align: center;"
                            onclick="location.href='guide.jsp'"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            <!-- 페이지이동2 "교통"-->
            <div style="float: left; width: 100%; height: 184px;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="교통" style="margin-top:75px; font-size: 20px; text-align: center;"
                            onclick="location.href='traffic.jsp'"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            
            <!-- 페이지이동3 "일정"-->
            <div style="float: left; width: 100%; height: 184px;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="일정" style="margin-top:75px; font-size: 20px; text-align: center;"
                            onclick="location.href='plan.jsp'"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            
        </div>

        <!--1-2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%;  height: 100vh; background-color: whitesmoke;">
			<jsp:include page="../Module/menu/map.jsp" flush="false"/>
        </div>

    </div>
</body>
</html>