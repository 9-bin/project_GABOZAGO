<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<!-- 부트스트랩 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 메뉴 버튼 -->
<div>
	<div style="margin: 5% 0 0 2%;">
		<div>
			<button class="btn btn-outline-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="float: left;">
				<!-- 버튼 아이콘 (부트 스트랩) --> 
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
				</svg>
			</button>
		</div>
	</div>
	
<!-- 페이지 이름 영역 -->
	<div>
		<p>
			<span style="border-radius: 15px 15px 15px 0; border: 3px solid #394653; padding: 0.5em 0.4em; color: #333b42; margin: 0 50px 0 100px;font-size: 16.5px;">
				GABOZAGO
			</span>
		</p>
	</div>
</div>

<!-- 열린 메뉴 창 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
	    
	    <!-- 로그인부분 -->
		<div class="btn" style="padding: none; border: none;">
		    <form action="login.do" method="post">
		            <button id="btn_login" type="submit" style="padding:none;border: none; background: none; ">
		            	<img src="../emoji/btn_logout1.png" style="width:25px; height: 25px;">
		            </button>
		    </form> 
		</div>
	    
	    <!-- 창 닫힘 버튼  -->
	    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	

	<div style="margin: 0 15px 0 15px; font-size: 14px">
		<!-- 로그인 시 노출되게 설정-servlet
		(*^▽^*) NAME(userid) 님 반갑습니다  -->
		<hr>
	</div>

<!-- 메뉴 내부 항목 -->
	<div class="offcanvas-body small">
		<ul class="nav flex-column">
	
			<li class="nav-item">
   				<a class="nav-link active" aria-current="page" href="plan.do">일정</a>
	   		</li>
		    <li class="nav-item">
		   		<a class="nav-link" href="traffic.do">교통</a>
		    </li>
		    <li class="nav-item">
		   		<a class="nav-link" href="guide.do">가이드</a>
		    </li>
		    <br>
		    <li class="nav-item">
			    <a class="nav-link" href="#" onclick="alert('로그인해주세요')">공유하기</a>
			 </li>
			 <li class="nav-item">
   				<a class="nav-link" href="#" onclick="alert('로그인해주세요')">커뮤니티</a>
		   	 </li>
		  	 <hr>
		     <li class="nav-item" id="admin">
		     	<a class="nav-link disabled" href="admin.do">관리자</a>
			</li>
		     <li class="nav-item" id="admin"> <!-- 로그인 시 노출 - disabled 없애기 -->
		     	<a class="nav-link disabled" href="#">회원정보 수정</a>
			</li>
		</ul>
	</div>
</div>

</body>
</html>