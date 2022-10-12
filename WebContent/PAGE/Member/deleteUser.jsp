<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--영역 나누기-->
<div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
	<!--영역 안에서 세로로 나누기-->    
    <!--1(왼쪽)-->
    <div class="left" style="float: left; width: 30%; height: 100vh;background-color: whitesmoke;">
	      <!-- 메뉴 -->
	    <jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
	      
	      <!-- 회원 정보 수정 TEXT 영역 -->
		<form action="deleteUserOK.do" name="frm" onsubmit="return checkCorrect(this)">
			<div style="margin: 80px 15px 5px 15px; height: 50px;">
	              <h1 span style="border-bottom: 3px solid steelblue"> 회원 탈퇴 </h1>
	        </div> 
	          <!-- 회원 정보 수정 입력창 영역 -->
	        <div style="width:95%; height:200px; margin: 60px 5px 5px 5px;">
	           <!--  수정!  -->
				<div style="width: 100%; height: 70%; margin-left: 5px">
					<div class="input-group mb-3" style="margin-top: 20px;">
	  	      			<span class="input-group-text" id="" basic-addon1">아 이 디</span>
	                    	<input type="text" class="form-control" value="${userId}" aria-label="아 이 디"
	                       		aria-describedby="basic-addon1" name="userid" readonly="readonly">
	                </div>
	                <div class="input-group mb-3" style="margin-top: 20px;">
	                    <span class="input-group-text" id="" basic-addon1">이 메 일</span>
	                    <input type="text" class="form-control" value="${email}" aria-label="이 메 일"
	                        aria-describedby="basic-addon1" name="email">
	                </div>
	                <div class="input-group mb-3" style="margin-top: 20px;">
	                    <span class="input-group-text" id="" basic-addon1">전 화 번 호</span>
	                    <input type="text" class="form-control" value="${phone}" aria-label="전 화 번 호"
	                        aria-describedby="basic-addon1" name="phone">
	                </div>
		            <div style="float:left; width:80px; height:60px;float: right;">
	                    <input class="btn btn-primary" type="submit" value="탈퇴" onclick="return del_user()"
	                        style="font-size: 15px; text-align: center; margin-top: 20px; justify-content: flex-start;">
	                </div>
				</div>
			</div>
		</form>
	</div>
			<!--1-2(오른쪽)-->
    <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
<%-- 		<jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
	</div>

</div>
</body>
<script type="text/javascript">

	function del_user() {
		var delConfirm = confirm(${name}+ ' 님 정말 회원 탈퇴를 하시겠습니까?');
		
		if (delConfirm) {
			return true;
		} else {
			alert('삭제가 취소되었습니다');
			return false;
		}
	}
</script>
</html>
