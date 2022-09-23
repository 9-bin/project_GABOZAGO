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
            <div style="float: left; width: 30%; height: 100vh; background-color: lightgray;">

				<jsp:include page="menu/menu.jsp" flush="false"/>



                <form action="login.do" method="post">
                    <div style="margin: 80px 15px 5px 15px; height: 50px;">
                        <h1 span style="border-bottom: 3px solid steelblue"> &nbsp 회원가입 </h1>
                    </div>

                    <div style="width:95%; height:200px; margin: 60px 5px 5px 5px;">
                        <!--  수정!  -->
                        <div style="width: 100%; height: 70%; margin-left: 5px">
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">이름</span>
                                <input type="text" class="form-control" placeholder="이름" aria-label="이름"
                                    aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">이메일</span>
                                <input type="text" class="form-control" placeholder="이메일" aria-label="이메일"
                                    aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">아이디</span>
                                <input type="text" class="form-control" placeholder="아이디" aria-label="아이디"
                                    aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">비밀번호</span>
                                <input type="text" class="form-control" placeholder="비밀번호" aria-label="비밀번호"
                                    aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3" style="margin-top: 20px;">
                                <span class="input-group-text" id="" basic-addon1">전화번호</span>
                                <input type="text" class="form-control" placeholder="전화번호" aria-label="전화번호"
                                    aria-describedby="basic-addon1">
                            </div>
                            <div class="form-floating" style="margin-top: 20px;">
                                <select class="form-select" id="floatingSelect"
                                    aria-label="Floating label select example">
                                    <option selected>성별을 선택해주세요</option>
                                    <option value="1">남자</option>
                                    <option value="2">여자</option>
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

                <!-- 지도영역부분 -->
                <div id="map" style="width:100%;height:100%;"></div>

                <script type="text/javascript"
                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7d3428f35bb9a9deb43f36f2716406"></script>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        var offcanvasElementList = [].slice.call(document.querySelectorAll('.offcanvas'))
        var offcanvasList = offcanvasElementList.map(function (offcanvasEl) {
            return new bootstrap.Offcanvas(offcanvasEl)
        })
        document.getElementById('admin').style.display = 'none';
    </script>

</html>