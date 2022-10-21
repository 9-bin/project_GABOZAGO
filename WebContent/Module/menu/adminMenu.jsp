<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
 	Integer admin = (Integer)session.getAttribute("admin"); 
	String userid = (String)session.getAttribute("userId");
	String Name = (String)session.getAttribute("name");
	System.out.println("menu : " + Name);
%>
<html>

<head>
<meta charset="UTF-8">
<title>어드민 메뉴</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    
    <!-- 메뉴 버튼 -->
    <div style="margin: 10px 0 0 10px;">
    <button class="btn btn-outline-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
        aria-controls="offcanvasRight">
        <!-- 버튼 아이콘 (부트 스트랩) -->
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list"
            viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
        </svg>
    </button>
    </div>
    
    <!-- 열린 메뉴 창 -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <!-- 창 상단 -->
        <div class="offcanvas-header">
               <!-- 로그인부분 -->
		    <div class="btn" style="padding: none; border: none;">
	            <button id="btn_login" onclick="DDAN()" style="padding:none;border: none; background: none; ">
	                <img src="/PJ_GABOZAGO/Image/btn_logout1.png" style="width:25px; height: 25px;">
	            </button>
		    </div>
		    
		    <div>
				つ ◕_◕ ༽つ <br> 관리자 : <%=Name%>( <%= userid%> ) 님
			</div>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>    
        </div>
		
        <!-- 메뉴 내부 항목 -->
        <div class="offcanvas-body small">
            <ul class="nav flex-column">
            	<li class="nav-item">
                    <a class="nav-link" href="adminMember.do">회원관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="adminGuide.do">가이드정보관리</a>
                </li>
                <hr>
                <li class="nav-item" id="admin">
                    <a class="nav-link" href = "index.do">홈페이지</a>
                </li>
                <li class="nav-item userInfo" id="logout"> 
		     	<a class="nav-link" href="logout.do">로그아웃</a>
				</li>
            </ul>
        </div>
    </div>



</body>
<script type="text/javascript">
	function DDAN() {
		window.open("${contextPath}/PJ_GABOZAGO/PAGE/Admin/DDAN.jsp", "", "width = 350, height = 480");
	}
</script>
</html>