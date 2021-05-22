<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/css/styles.css" />" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/js/jquery-3.5.1.js" />"></script>

</head>
<body>
	<c:if test="${member == null}">
		<script>
			alert("로그인 후 이용 가능합니다.");
			location.href="/user/login";
		</script>
	</c:if>


	<jsp:include page="../include/header.jsp" />
	
	<form method="post" id="pw_form">
	<input type="hidden" name="memberType" value="${member.memberType}">
	<input type="hidden" name="userId" value="${member.userId}">
 	현재 비밀번호: <input type="password" name="userPw"> <br>
	새 비밀번호: <input type="password" name="newPw" id="newPw"><br>
	새 비밀번호 확인: <input type="password" id="newPwCheck"><br>
	<input type="button" value="비밀번호 변경" onclick="checkPW()">
	</form>
	
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

<script>

function checkPW() {
	
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,_,~])|([!,@,#,$,%,^,&,*,_,~].*[a-zA-Z0-9]){8,20}/);
	if($("#newPw").val() === "" || $("#newPwCheck").val() === ""){
		alert("입력 칸을 비워두실 수 없습니다.");
		return;
	}
	else if(!getPwCheck.test($("#newPw").val())){
		alert("비밀번호는 8 ~ 20자의 영문대소문자와 특수문자의 조합이 필수입니다.");
		return;
	}
	else if($("#newPw").val() != $("#newPwCheck").val()){
		alert("새 비밀번호 확인란과 새 비밀번호란이 일치하지 않습니다.");
		return;
	}
	else{
		pw_form.submit();
	}
}

</script>