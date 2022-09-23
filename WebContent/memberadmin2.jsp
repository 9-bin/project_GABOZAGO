<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드정보관리</title>
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>

<!--영역 나누기-->
    <div class="view" style=" width: 100vw; height: 100vh; background-color: whitesmoke;">
    		<!-- 어드민메뉴/로그인 -->
			<jsp:include page="menu/adminMenu.jsp" flush="false"/>
            
            
            <div style="width: 700px; height: 100px; margin: auto;">
            	<p><span style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid #B2E0F7; 
            	padding: 0.5em; background: #D8EFFB;">가이드정보관리</span></p>
            </div>

        	<!-- 관리자 상단 선택 영역 탭  -->
        	<div id="select" style="width: 700px; height: 150px; margin: auto;">
        		<div> <!-- 선택창 -->
        			<select class="form-select" aria-label="Default select example">
					  <option selected>Open this select menu</option>
					  <option value="1">One</option>
					  <option value="2">Two</option>
					  <option value="3">Three</option>
					</select>
        		</div>
        		<div class="input-group mb-3"> <!-- 검색창 -->
				  <input type="text" class="form-control" placeholder="검색하세요" aria-label="검색하세요" aria-describedby="button-addon2">
				  <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
				</div>
        		<div style="float: right;"> <!-- 다운로드 폴더이미지 -->
        			<svg xmlns="http://www.w3.org/2000/svg" width="45" height="40" fill="currentColor" class="bi bi-file-earmark-arrow-down-fill" viewBox="0 0 16 16">
				  		<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zm-1 4v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 0 1 .708-.708L7.5 11.293V7.5a.5.5 0 0 1 1 0z"/>
					</svg></div>
        	
        	<!-- 버튼 -->
        	<div style= "height: 50px;">
	        	<div class="btn-group" style="float: right;">
				  <a href="#" class="btn btn-primary">등록</a>
				  <a href="#" class="btn btn-primary">삭제</a>
				</div>
			</div>
        	
        	<!-- 표시될 리스트 영영 -->
        		<div>
        			<table class="tg" style="margin: auto;">
					<thead>
					  <tr>
					    <th class="tg-c3ow">no</th>
					    <th class="tg-c3ow">지역</th>
					    <th class="tg-c3ow">해시태그</th>
					    <th class="tg-c3ow">업체명</th>
					    <th class="tg-c3ow">주소</th>
					    <th class="tg-c3ow">종류</th>
					    <th class="tg-c3ow">괸리자</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
					    <td class="tg-c3ow"> 
					    <div class="form-check">
  							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  							<label class="form-check-label" for="flexCheckDefault">
    						1
  							</label>
						</div></td>
					    <td class="tg-c3ow" width="150">강릉</td>
					    <td class="tg-c3ow" width="150">해돋이맛집</td>
					    <td class="tg-c3ow" width="150">물회말아먹어</td>
					    <td class="tg-c3ow" width="200">강원도 강릉시 어쩌구 23-1</td>
					    <td class="tg-c3ow" width="150">식당</td>
					    <td class="tg-c3ow" width="150">임구빈</td>
					  </tr>
					  <tr>
					    <td class="tg-c3ow"><div class="form-check">
  							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  							<label class="form-check-label" for="flexCheckDefault">
    						2
  							</label>
						</div></td>
					    <td class="tg-c3ow" width="150"></td>
					    <td class="tg-c3ow" width="150"></td>
					    <td class="tg-c3ow" width="150"></td>
					    <td class="tg-c3ow" width="200"></td>
					    <td class="tg-c3ow" width="150"></td>
					    <td class="tg-c3ow" width="150"></td>
					  </tr>
					</tbody>
				</table>
        		
        		</div>
        
        </div>

    </div>
</body>
</html>
