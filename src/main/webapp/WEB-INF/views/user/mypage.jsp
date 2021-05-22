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
	
	<input type="button" value="회원정보 수정" onclick="location.href='/user/updateInfo'"><br>
	<input type="button" value="비밀번호 수정" onclick="location.href='/user/updatePw'"><br>
	<input type="button" value="로그아웃" onclick="location.href='/user/logout'"><br>
	
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

<script>
	const result = "${msg}"
	if(result != "" && result.length > 0){
		alert(result);
	}


</script>