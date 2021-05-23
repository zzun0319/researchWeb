<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<!-- Core theme CSS (includes Bootstrap)-->
<link rel="icon" type="image/x-icon" href="<c:url value="/assets/favicon.ico" />" />
<link href="<c:url value="/css/styles.css" />" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/js/jquery-3.5.1.js" />"></script>

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	회원 정보 수정 페이지.. (이메일 인증 + 휴대폰 인증까지 공부하고) 나중에 구현 <br>
	<%-- <c:if test="${member == null}">
		<script>
			alert("로그인 후 이용 가능합니다.");
			location.href="/user/login";
		</script>
	</c:if>


	<jsp:include page="../include/header.jsp" />
		<form method="post" id="update_form">
			<input type="hidden" name="userId" value="${member.userId}">
			이메일 주소: <input type="text" name="email" id="email" value="${member.email}"> 
			휴대폰 번호: <input type="text" name="phoneNum" id="phoneNum" value="${member.phoneNum}"> 
			<input type="button" value="회원 정보 수정" onclick="updateInfo()">
		</form>
		 --%>
		 <button id="delete" onclick="location.href='/user/deleteUser'">탈퇴하기</button>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

<!-- <script>

function updateInfo() {
	$("#updateBtn").click(function() {
		
		const getEmailCheck = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/); // 이메일 형식만 가능
		
		const getPhoneNumCheck = RegExp(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/); // 000-0000-0000 형태만 가능
		
		if($("#email").val() == "" || $("#phoneNum").val() == ""){
			alert("입력 칸을 비워두실 수 없습니다.");
			return;
		}
		else if(!getEmailCheck.test($("#email").val())){
			alert("이메일 입력 형식이 아닙니다.");
			return;
		}
		else if(!getPhoneNumCheck.test($("#phoneNum").val())){
			alert("000-0000-0000 형식으로 입력해주세요.");
			return;
		}
		
	})
	
}

</script> -->
