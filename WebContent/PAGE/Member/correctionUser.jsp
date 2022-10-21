<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<!-- 이름/아이디/비밀번호/비밀번호 확인/이메일/전화번호 -->
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
    	<!--영역 안에서 세로로 나누기-->    
        <!--1(왼쪽)-->
        <div class="left" style="float: left; width: 100%; height: 100vh;background-color: whitesmoke;">
        <div style="margin: auto; background-color: whitesmoke; width: 50%;" >
        <!-- 메뉴 -->
        <jsp:include page="../../Module/menu/menu.jsp" flush="false"/>
        
        <!-- 회원 정보 수정 TEXT 영역 -->
		<form action="updateMember.do" name="frm" onsubmit="return checkCorrect(this)">
			<div style="margin: 80px 15px 5px 15px; height: 50px;">
                <h1 span style="border-bottom: 3px solid steelblue"> 회원 정보 수정</h1>
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
	                    <span class="input-group-text" id="" basic-addon1">이   름</span>
	                    <input type="text" class="form-control" value="${name}" aria-label="이   름"
	                        aria-describedby="basic-addon1" name="name">
	                </div>
	                <div class="input-group mb-3" style="margin-top: 20px;">
	                    <span class="input-group-text" id="" basic-addon1">이 메 일</span>
	                    <input type="text" class="form-control" value="${email}" aria-label="이 메 일"
	                        aria-describedby="basic-addon1" name="email">
	                </div>
	                <div class="input-group mb-3" style="margin-top: 20px;">
	                    <span class="input-group-text" id="" basic-addon1">비 밀 번 호</span>
	                    <input type="password" class="form-control" placeholder="비밀번호" aria-label="비밀번호"
	                        aria-describedby="basic-addon1" name="password">
	                </div>
	                <div class="input-group mb-3" style="margin-top: 20px;">
	                    <span class="input-group-text" id="" basic-addon1">비밀번호 확인</span>
	                    <input type="password" class="form-control" placeholder="비밀번호 확인" aria-label="비밀번호 확인"
	                        aria-describedby="basic-addon1" name="check_pwd">
	                </div>
	                <div class="input-group mb-3" style="margin-top: 20px;">
	                    <span class="input-group-text" id="" basic-addon1">전 화 번 호</span>
	                    <input type="text" class="form-control" value="${phone}" aria-label="전 화 번 호"
	                        aria-describedby="basic-addon1" name="phone">
	                </div>
	                <div style="float:left; width:80px; height:60px;float: right;">
	                    <input class="btn btn-primary" type="submit" value="확인" onclick="return checkCorrect()"
	                        style="font-size: 15px; text-align: center; margin-top: 20px; justify-content: flex-start;">
	                </div>
	            </div>
	
	
        	</div>
		</form>
		<!--1-2(오른쪽)-->
<%--
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
 		<jsp:include page="../../Module/menu/map.jsp" flush="false"/> 
        </div>
--%>
        </div>
    </div>
</div>
       
</body>
<script type="text/javascript">
  	function checkUpdateEmail(str) {
		var Email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!Email.test(str)) {
			return false;
		} else {
			return true;
		}
	}
  	
  	function checkUpdatePhone(str) {
		var Email = /^([0-9]+)-([0-9]+)-([0-9])$/;
		if (!Email.test(str)) {
			return false;
		} else {
			return true;
		}
	}
  	
  	function checkCorrect() {
  		if (! document.frm.name.value) {
  			alert("이름을 입력하세요");
  			document.frm.name.focus();
  			return false;
  		}
  		if (! document.frm.userid.value) {
  			alert("아이디를 입력하세요");
  			document.frm.userid.focus();
  			return false;
  		}
  		if (! document.frm.password.value) {
  			alert("비밀번호를 입력하세요");
  			document.frm.password.focus();
  			return false;
  		}
  		if (document.frm.password.value != document.frm.check_pwd.value) {
  			alert("패스워드가 일치하지 않습니다");
  			document.frm.check_pwd.focus();
  			return false;
  		}
  		if (! document.frm.email.value) {
  			alert("이메일을 입력하세요");
  			document.frm.name.focus();
  			return false;
  		} else {
  			if(!checkUpdateEmail(document.frm.email.value)) {
  				alert("이메일 형식이 잘못되었습니다");
  				document.frm.email.focus();
  				return false;
  			}
  		}
  		if (! document.frm.phone.value) {
  			alert("핸드폰 번호를 입력하세요");
  			document.frm.phone.focus();
  			return false;
  		} else {
  			if(!checkUpdatePhone(document.from.phone.value)) {
  				alert("000-0000-0000 형식을 지켜주세요")
  				document.frm.phone.focus();
  				return false;
  			}
  		}
  		return true;
  	}
</script>

</html>
