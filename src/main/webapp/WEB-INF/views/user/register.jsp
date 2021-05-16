<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="icon" type="image/x-icon" href="<c:url value="/assets/favicon.ico" />" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/css/styles.css" />" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/js/jquery-3.5.1.js" />"></script>

</head>
<body>

	<jsp:include page="../include/header.jsp" />
	
	<div class="container">
		<p>
		<h2>회원가입을 환영합니다.</h2>
		</p>
		<p>
		<form method="post">
			<table>
				<tr>
					<td>회원분류</td>
					<td>
						<select name="memberType">
							<option>=== 선택 === </option>
							<option value="학부생">학부생</option>
							<option value="대학원생">대학원생</option>
							<option value="강사">강사</option>
							<option value="지도교수">지도교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="submit" value="다음">
					</td>
				</tr>
			</table>
		</form>
		</p>
		
		
	</div>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>
