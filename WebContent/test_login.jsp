<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
</head>
<body>
<div style=" width: 100%; height: 650px;">
        <!--1-1(왼쪽)-->
        <div style="float: left; width: 30%; height: 650px; background-color: lightslategray;">
            <h1 span style="border:0 padding: 0.4em; text-align:center">GABOZAGO</span></h1>
    
        
        <form action="login.do" method="post">
            <div style="margin: 100px 15px 5px 15px; height: 50px;">
                <h1 span style="border-bottom: 3px solid steelblue"> &nbsp 로그인</h1>
            </div>  
            
            <div style="width:95%; height:200px; margin: 20px 5px 5px 5px;">      <!--  수정!  -->
               <div style="float: left; width: 65%; height: 100%; margin-left: 5px">
               <input type="text" name="userid" value="id" style="height: 25px; margin-top: 30%;">
               <input type="password" name="userpwd" style="height: 25px; margin-top: 5px;">
              </div>             
               <div style="float:left; width:80px; height:39px;float: right;">
                   <a href="join.jsp" style="width: 50px;">회원가입</a>
                   <div>
                       <input type="submit" value="로그인" 
                       style="font-size: 15px; text-align: center; margin-top: 20px; justify-content: flex-start; height: 110px;">
               </div>
               </div>  

            </div>
        
        </form>

         </div>
         
         <!--1-2(오른쪽)--> 
        <div style="float: right; width: 70%; height: 650px; background-color: whitesmoke;">

            <div id="map" style="width:100%;height:650px;"></div>

                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7d3428f35bb9a9deb43f36f2716406"></script>
                <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(36.450701, 127.570667), // 지도의 중심좌표
                        level: 13 // 지도의 확대 레벨
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                </script>
        </div>
    
    </div>
</body>
</html>