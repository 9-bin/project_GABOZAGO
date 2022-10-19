<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 장소 등록</title>
<script type="text/javascript" src="Script/adminGuide.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: whitesmoke;">
    		<!-- 어드민메뉴/로그인 -->
    		<div style="float: left; background-color: whitesmoke;">
			<jsp:include page="../../Module/menu/adminMenu.jsp" flush="false"/>
			</div>
            
            
            <div style="width: 700px; height: 100px; margin: auto;">
            	<p style="height: 0px;">
            	<span style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid #B2E0F7; 
            	padding: 0.5em; background: #D8EFFB; margin-top: 20px;">가이드 장소 등록</span></p>
            </div>

        	<!-- 관리자 상단 선택 영역 탭  -->
        	<div id="select" style="width: 700px; height: 150px; margin: auto;">

        		&nbsp;
				'*' 표시 항목은 필수 입력 항목입니다.
				<hr>
				<form action="GuideInsertOK.do" name="gfrm" onsubmit="return checkGuide(this)">
					<div class="form-floating" style="margin-top: 20px;">
						<select class="form-select" id="floatingSelect" name="local"
                                    aria-label="Floating label select example">
                                    <option selected>지역을 선택해주세요</option>
                                    <option value="1">강원도</option>
                                    <option value="2">경상도</option>
                                    <option value="3">수도권</option>
                                    <option value="4">전라도</option>
                                    <option value="5">제주도</option>
                                    <option value="6">충청도</option>
                                </select>
                        <label for="floatingSelect">* 지역</label>
					</div>
					<div class="form-floating" style="margin-top: 20px;">
						<select class="form-select" id="floatingSelect" name="placetype"
                                    aria-label="Floating label select example">
                                    <option selected>장소 타입을 선택해주세요</option>
                                    <option value="1">관광지</option>
                                    <option value="2">레포츠</option>
                                    <option value="3">문화시설</option>
                                    <option value="4">숙박시설</option>
                                    <option value="5">음식점</option>
                                </select>
                        <label for="floatingSelect">* 장소타입</label>
					</div>
					<div class="input-group mb-3" style="margin-top: 20px;">
                    	<span class="input-group-text" id="basic-addon1">*장소이름</span>
                        <input type="text" class="form-control" placeholder="장소이름" aria-label="장소이름"
                                    aria-describedby="basic-addon1" name="placename">
                    </div>
                    <div class="input-group mb-3" style="margin-top: 20px;">
                    	<span class="input-group-text" id="basic-addon1">전화번호</span>
                        <input type="text" class="form-control" placeholder="전화번호" aria-label="전화번호"
                                    aria-describedby="basic-addon1" name="placephone">
                    </div>
                    <div class="input-group mb-3" style="margin-top: 20px;">
                    	<span class="input-group-text" id="basic-addon1">*주소</span>
                        <input type="text" class="form-control" placeholder="주소" aria-label="주소"
                                    aria-describedby="basic-addon1" name="adress">
                    </div>
                    <div class="input-group mb-3" style="margin-top: 20px;">
                    	<span class="input-group-text" id="basic-addon1">*위도</span>
                        <input type="text" class="form-control" placeholder="위도" aria-label="위도"
                                    aria-describedby="basic-addon1" name="latitude">
                    </div>
                    <div class="input-group mb-3" style="margin-top: 20px;">
                    	<span class="input-group-text" id="basic-addon1">*경도</span>
                        <input type="text" class="form-control" placeholder="경도" aria-label="경도"
                                    aria-describedby="basic-addon1" name="longtiude">
                    </div>

						<input class="btn btn-primary" type="submit" value="확인">  
						<input class="btn btn-primary" type="reset" value="취소" onclick="adminGuide.do"></td>

				</form>
		</div>
</div>
</body>
</html>