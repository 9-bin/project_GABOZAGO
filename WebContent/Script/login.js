/**
 * 만약 개발자 도구에서 소스가 안보이는 경우
 * 1. Network 탭으로 이동, Disable cache 체크박스 체크
 * => Sources 탭으로 이동하여 새로고침
 * 2. 그래도 안보이면 Console 탭으로 이동, console.log 입력 후 엔터
 * => Sources 탭으로 이동하여 새로고침
 */


// join.jsp 에서 사용

// join.jsp의 userid 칸이 공백이라면
function checkId() {
	if (!document.frm.userid.value === ""){
		alert('아이디를 입력하여 주세요');
		frm.userid.focus();	// userid 칸으로 자동 커서 옮김
		return;	// 함수 종료
	}
}

// 회원가입 페이지에서 입력된 양식에 정상 데이터가 포함되었는지 확인
function checkJoin() {
	// 이름
	if (document.frm.name.value.length === 0) {
		alert('이름을 입력해주세요.');
		frm.name.focus();
		return false;
	}
	// 아이디
	if (document.frm.userid.value.length === 0) {
		alert('아이디 중복확인이 필요합니다.');
		frm.userid.focus();
		return false;
	}
	// 아이디 글자 수 - 4자리보다 작으면 재입력
	if (document.frm.userid.value.length < 4) {
		alert('아이디는 4자 이상 입력해야 합니다.');
		frm.name.focus();
		return false;
	}
	// 비밀번호
	if (document.frm.password.value.length === 0) {
		alert('비밀번호를 입력해주세요.');
		frm.password.focus();
		return false;
	}
	// 비밀번호 확인
	if (document.frm.check_pwd.value.length === 0) {
		alert('입력한 비밀번호와 일치하지 않습니다.');
		frm.check_pwd.focus();
		return false;
	}
	return true;
}

