<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 보기</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/login.js"></script>
</head>
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 30%; height: 100vh;background-color: lightslategray;">
			<!-- 로그인부분 -->
            <div style="float: left; width: 100%; height: 50px;background-color:lightslategray;">
                <form action="login.do" method="post">
                    <table>
                        <tr>
                            <td><input type="submit" value="로그인" style="font-size: 20px; text-align: center;"></td>
                        </tr>

                    </table>
                </form>
            </div>
            <!-- 가보자고 시작페이지 링크 넣어주기 -->
            <div style="float: left; width: 100%; height: 50px;background-color:lightslategray;">
                <h1 span style="border:5px double #DCDCDC; padding: 0.4em; text-align:center; font-size: 10px;">
                    GABOZAGO</h1>
            </div>
            <!-- 일정생성//가이드/교통 영역나눠서 테이블로 버튼생성 -->
            <div style="float: left; width: 100%; height: 37.5px;background-color:lightslategray;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="커뮤니티" style="font-size: 20px; text-align: center;"></td>
                        </tr>

                    </table>
                </form>
            
            </div>
            <div style="float: left; width: 100%; height: 37.5px;background-color:lightslategray;">
                <form action="login.do" method="post">
                    <table style=" margin:auto; " >
                        <tr>
                            <td><input type="submit" value="가이드" style="font-size: 20px; text-align: center;"></td>
                            <td><input type="submit" value="교통" style="font-size: 20px; text-align: center;"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <!-- 날짜보여주는 부분 없음 -->
            <div style="float: left; width: 100%; height: 40px;background-color:lightslategray; margin-top: 20px;">
                
                <hr>
            </div>
            
            <!-- 목록 보여주기 -->
            <div style="float: left; width: 100%; height: 400px;background-color:lightslategray;">
				<!-- 여기다가 목록 보여주기 -->
				여기다가 목록 보여주자
				강릉<br>
				속초<br>
				부산<br>
				여수<br>
				
            </div>
        </div>

        <!--1-2(오른쪽)--> 
        <div style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
        	<!-- 본문 부분 영역 나누기 -->
			<div style="float: right; width: 100%; height: 100px;; background-color: whitesmoke;">
				게시글 제목 <hr>
            </div>
			<div style="float: right; width: 100%; height: 260px;; background-color: whitesmoke;">
				본문 게시글 내용
			</div>
			<div style="float: right; width: 100%; height: 130px;; background-color: whitesmoke;">
				<hr>이모지
                    <table>
                        <tr>
                            <td>
                            	<img src="emoji/CryingEmoji.png" style="width:25px; height:25px;" onclick="alert('로그인해주세요.');" style="cursor:pointer;" />
                            	<img src="emoji/HeartEyesEmoji.png" style="width:25px; height:25px;" onclick="alert('로그인해주세요.');" style="cursor:pointer;" />
                            </td>
                            
                        </tr>
                    </table>	
			</div>
			<div style="float: right; width: 100%; height: 160px;; background-color: whitesmoke;">
				<hr>댓글
				<form action="login.do" method="post" name="frm">
                    <table>
                        <tr>
                            <td><input type="text" name="comment"></td>
                            <td> <!-- 나중에 자바스크립트활용하여 구현 -->
	                            <input type="button" value="확인" onclick="alert('로그인해주세요')" style="cursor:pointer">
	                            <input type="reset" value="취소">
                            </td>
                        </tr>
                    </table>
                </form>
			</div>
			
		</div>

    
    </div>


 
</body>
</html>