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
		

		비밀번호를 입력하세요&nbsp;&nbsp;
		<input type="password" id="pwChk">&nbsp;&nbsp;
		<button onclick="Delete()">탈퇴</button>
		
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

<script>
	function Delete() {
		
		if($("#pwChk").val() != "${member.userPw}"){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		} else {
			if(confirm("정말로 탈퇴하시겠습니까?")){
				
				$.ajax({
					
					type: "POST",
					url: "/user/deleteUser",
					data: {
						userId : "${member.userId}"
					},
					success: function(result) {
						console.log("통신 성공!: " + result);
						if(result === "OK"){
							alert("탈퇴되었습니다.");
							location.href="/user/login";
						}
						else {
							alert("탈퇴에 실패했습니다. 관리자에게 문의해주세요.");
							location.href="/user/login";
						}
					},
					error: function() {
						console.log("통신 실패!");
					}
					
				}) // ajax
			}else{ // 취소
				return;
			}
		}
	}

</script>