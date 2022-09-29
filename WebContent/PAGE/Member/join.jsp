<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <link href="" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>

<body>

    <body>
        <!--영역 나누기-->
        <!--영역 안에서 세로로 나누기-->
        <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
            <!--1-1(왼쪽)-->
            <div style="float: left; width: 30%; height: 100vh; background-color: whitesmoke;">

				<jsp:include page="../menu/menu.jsp" flush="false"/>



                <form action="../join.do" method="post" name="frm">
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
                                    aria-describedby="basic-addon1" name="userid">
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
                        <!-- 관리자 / 일반 회원 가입 여부 선택 ... 이 필요할까요...? 어차피 관리자는 셋으로 끝인데...???   
                            <div class="form-floating" style="margin-top: 20px;">
                                <select class="form-select" id="floatingSelect"
                                    aria-label="Floating label select example">
                                    <option selected>회원 등급</option>
                                    <option value="0" name="admin">일반 회원</option>
                                    <option value="1" name="admin">관리자</option>
                                </select>
                                <label for="floatingSelect">회원 등급</label>
                            </div>
                             -->
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
				<jsp:include page="../menu/map.jsp" flush="false"/>
            </div>

        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        var offcanvasElementList = [].slice.call(document.querySelectorAll('.offcanvas'))
        var offcanvasList = offcanvasElementList.map(function (offcanvasEl) {
            return new bootstrap.Offcanvas(offcanvasEl)
        })
        document.getElementById('admin').style.display = 'none';
    </script>


</html>