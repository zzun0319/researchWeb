<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<link rel="icon" type="image/x-icon" href="<c:url value="/assets/favicon.ico" />" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/css/styles.css" />" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/js/jquery-3.5.1.js" />"></script>

<style type="text/css">
#rightColumn{
	width: 100%;
}
</style>

</head>
<body>

	<jsp:include page="../include/header.jsp" />
	
	<form enctype="multipart/form-data" method="post">
	
		<input type="hidden" name="researcher" value="${member.userId}">
		연구제목: <input type="text" name="researchTitle"> <br>
		연구목적: <input type="text" name="researchPurpose"> <br>
		연구방법 및 절차: <textarea rows="5" name="researchMethod"></textarea> <br>
		연구과정 볼 수 있는 이미지 및 설명이 있는 파일 첨부: <input type="file" name="attachedFile"> <br>
		
		<input type="submit" value="제출"> <input type="reset" value="리셋">
		
	</form>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>
