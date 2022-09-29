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
        <div class="left" style="float: left; width: 30%; height: 1500px; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
			
            <!-- 메뉴 -->
            <div style="float: left; width: 100%; height: 100px;">
                <!-- 부트스트랩 활용 include -->
				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
                    <hr>
            </div>
        
            
            <!-- 목록 보여주기 -->
            <div><!-- 여기다가 목록 보여주기 -->
				<!-- 메뉴 내부 항목 -->
                <div class="offcanvas-body small">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="plan.do">속초</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="traffic.do">강릉</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >여수</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >부산</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >충청도</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" >수도권</a>
                        </li>
                    
                    </ul>
                </div>
            </div>
        </div>

        <!--1-2(오른쪽)--> 
        <div style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
        	<!-- 본문 부분 영역 나누기 -->
			<div style="height: 34px; "></div>
			<div style="height: 45px; margin: none;">
				<span style="background: #F9F7F6; border-left: 0.5em solid #688FF4; padding: 0.5em;">
				게시글 제목</span>
            </div>
			<div style="height: 500px; padding: none;margin: none;">
			<hr>
				본문 게시글 내용
			</div>
			<div style="float: right; width: 100%; height: 130px;">
				<hr>이모지
                    <table>
                        <tr>
                            <td>
                            	<img src="../emoji/CryingEmoji.png" style="width:25px; height:25px;" onclick="alert('로그인해주세요.');" style="cursor:pointer;" />
                            	<img src="../emoji/HeartEyesEmoji.png" style="width:25px; height:25px;" onclick="alert('로그인해주세요.');" style="cursor:pointer;" />
                            </td>
                            
                        </tr>
                    </table>	
			</div>
			<!-- 부트스트랩 활용, 댓글다는 창 -->
			<div class="card mb-2">
				<div class="card-header bg-light">
				        <i class="fa fa-comment fa"></i> REPLY
				</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
					    <li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
							<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
							<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
							<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
						</div>
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
					    </li>
					</ul>
				</div>
			</div>
		</div>	
	</div>

</body>
</html>