<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>

</head>
<body>

	<jsp:include page="../include/header.jsp" />
	
	<div class="container">
		<p>
		<h2>회원가입 정보를 입력해주세요.</h2>
		</p>
		<p>
		<form method="post">
			<table>
				<tr>
					<td>회원분류</td>
					<td>
						<input name="memberType" value="${memberType}" disabled>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="userId">
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="submit" value="회원가입">
					</td>
				</tr>
			</table>
		</form>
		</p>
		
		
	</div>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>
