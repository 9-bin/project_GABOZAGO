<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>딴지렁이의 저주!</title>
</head>
<body>

	<div>
	<img src="/PJ_GABOZAGO/Image/DDAN.png" width="300px;">
	</div>
    <input type="button" class="btn btn-primary" onclick="GO()" value="이동!" />

</body>
<script type="text/javascript">
function GO() {
	window.opener.location.href = "../../main.do";
	window.close();
}
</script>
</html>
