<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연구개설 페이지</title>

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

	<c:if test="${member == null}">
		<script>
			alert("로그인 후 이용 가능합니다.");
			location.href="/user/login";
		</script>
	</c:if>
	<c:if test="${member.memberType != '대학원생'}">
		<script>
			alert("대학원생이 아닙니다.");
			location.href="/user/login";
		</script>
	</c:if>

	<jsp:include page="../include/header.jsp" />
	
		<form method="post">
		
			<table border="1">
				<tr>
					<td>연구 유형</td>
					<td>
						<select name="researchType">
							<option>=== 유형 선택 ===</option>
							<option value="오프라인 실험">오프라인 실험</option>
							<option value="오프라인 설문">오프라인 설문</option>
							<option value="기타(오프라인)">기타(오프라인)</option>
							<option value="온라인 실험">온라인 실험</option>
							<option value="온라인 설문">온라인 설문</option>
							<option value="온라인">기타(온라인)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>보상 방법</td>
					<td>
						<input type="radio" name="rewardType" value="학점"> 학점 <br>
						<input type="radio" name="rewardType" value="참가비"> 참가비 <br>
						<input type="radio" name="rewardType" value="기타"> 기타 <br>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="계속"></td>
				</tr>
			</table>
			
		
		</form>
	
	<jsp:include page="../include/footer.jsp" />

</body>
</html>