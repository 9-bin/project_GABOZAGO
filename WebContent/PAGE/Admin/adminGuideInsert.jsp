<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 장소 등록</title>
<script type="text/javascript" src="Script/adminGuide.js"></script>
</head>
<body>
<h2> 가이드 장소 등록 </h2>
'*' 표시 항목은 필수 입력 항목입니다.

<form action="GuideInsertOK.do" name="gfrm" onsubmit="return checkGuide(this)">
<table>
	<tr>
		<td>지역</td>
		<td><input type="text" name="local">*</td>
	</tr>
	<tr>
		<td>장소타입</td>
		<td><input type="text" name="placetype">*</td>
	</tr>
	<tr>
		<td>장소 이름</td>
		<td><input type="text" name="placename">*</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="placephone"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="adress">*</td>
	</tr>
	<tr>
		<td>위도</td>
		<td><input type="text" name="latitude">*</td>
	</tr>
	<tr>
		<td>경도</td>
		<td><input type="text" name="longtiude">*</td>
	</tr>

	<tr>
		<td colspan="2" align="center">
		 <!--  action="join.do" method="post" 로 이동: 
		 JoinSelvel doPodt로 받음  -->
		<input type="submit" value="확인">  
		<input type="reset" value="취소" onclick="adminGuide.do"></td>
	</tr>

</table>

</form>
</body>
</html>