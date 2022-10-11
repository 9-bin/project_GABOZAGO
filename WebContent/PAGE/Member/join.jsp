<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <link href="" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>

<body>

        <!--영역 나누기-->
        <!--영역 안에서 세로로 나누기-->
        <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
            <!--1-1(왼쪽)-->
            <div style="float: left; width: 30%; height: 100vh; background-color: whitesmoke;">

				<jsp:include page="../../Module/menu/menu.jsp" flush="false"/>



                <form action="joinOK.do" name="frm" onsubmit="return check(this)">
                    <div style="margin: 80px 15px 5px 15px; height: 50px;">
                        <h1 span style="border-bottom: 3px solid steelblue"> &nbsp 회원가입 </h1>
                    </div>

                    <div style="width:95%; height:200px; margin: 60px 5px 5px 5px;">
                        <!--  수정!  -->
                        <div style="width: 100%; height: 70%; margin-left: 5px">
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">이   름</span>
                                <input type="text" class="form-control" placeholder="이름" aria-label="이름"
                                    aria-describedby="basic-addon1" name="name">
                            </div>
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">이 메 일</span>
                                <input type="text" class="form-control" placeholder="이메일" aria-label="이메일"
                                    aria-describedby="basic-addon1" name="email">
                            </div>
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">아 이 디</span>
                                <input type="text" class="form-control" placeholder="아이디" aria-label="아이디"
                                    aria-describedby="basic-addon1" name="userid" onkeydown="inputIdChk()">
                                <input type="button" class="btn btn-primary checkId" id="dbCheckId" onclick="fn_dbCheckId()" value="중복 체크"
                                    style="font-size: 10px; margin-left:2px; text-align: center; justify-content: flex-start;">
                                <input type="hidden" name="idDuplication" value="idUncheck">
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
                                <input type="text" class="form-control" placeholder="000-0000-0000" aria-label="전화번호"
                                    aria-describedby="basic-addon1" name="phone">
                            </div>
                            <div class="form-floating" style="margin-top: 20px;">
                                <select class="form-select" id="floatingSelect" name="gender"
                                    aria-label="Floating label select example">
                                    <option selected>성별을 선택해주세요</option>
                                    <option value="0">남자</option>
                                    <option value="1">여자</option>
                                </select>
                                <label for="floatingSelect">성별</label>
                            </div>
                            <div style="float:left; width:80px; height:60px;float: right;">
                                <input class="btn btn-primary" type="submit" value="회원가입"
                                    style="font-size: 15px; text-align: center; margin-top: 20px; justify-content: flex-start;">
                            </div>
                        </div>


                    </div>

                </form>


            </div>


            <!--1-2(오른쪽)-->
            <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
<%-- 				<jsp:include page="../../Module/menu/map.jsp" flush="false"/> --%>
            </div>

        </div>
    </body>

    <script type="text/javascript">
    	function fn_dbCheckId() {
			var joinForm = document.frm;
			var id = joinForm.userid.value;
			
			if (! document.frm.userid.value) {
    			alert("아이디를 입력하세요");
    			document.frm.userid.focus();
    			return false;
    		} else {
    			window.open("${contextPath}/PJSTUDY/dbCheckId.do?userid="+id, "", "width = 500, height = 300");
    		}
		}
    	
    	function inputIdChk() {
    		   var joinForm = document.frm;
    		   var dbCheckId = document.frm.dbCheckId;
    		   document.frm.idDuplication.value="idUnchek";
    		   dbCheckId.disabled=false;
    		   dbCheckId.style.opacity=1;
    		   dbCheckId.style.cursor="pointer";
    		}
    
    
    	function checkEmail(str) {
			var Email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if (!Email.test(str)) {
				return false;
			} else {
				return true;
			}
		}
    	
    	function check() {
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
    			if(!checkEmail(document.frm.email.value)) {
    				alert("이메일 형식이 잘못되었습니다");
    				document.frm.email.focus();
    				return false;
    			}
    		}
    		if (! document.frm.phone.value) {
    			alert("핸드폰 번호를 입력하세요");
    			document.frm.phone.focus();
    			return false;
    		}
    	}
    </script>


</html>