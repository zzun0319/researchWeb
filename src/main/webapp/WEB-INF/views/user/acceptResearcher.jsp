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
	<c:if test="${member.memberType != '지도교수'}">
		<script>
			alert("지도교수가 아닙니다.");
			location.href="/user/login";
		</script>
	</c:if>

	<jsp:include page="../include/header.jsp" />
	<p>
	<h2>[가입 승인하기]</h2>
	<h3> ▶ 승인 요청 학생 목록 </h3>
	</p>
	<p align="left">
	<button>전체 목록</button> <!-- 나중에 구현 -->
	<button>승인 완료 목록</button>
	<button>승인 대기 목록</button>

	</p>
	<p>
	<form method="post" action="/user/acceptResearcher2">
	<input type="hidden" name="major" value="${member.major}">
		<table border="1">
			<tr>
				<td>학생 이름</td>
				<td>학번</td>
				<td>승인</td>
			</tr>
			<c:forEach var="student" items="${GStudentList}" varStatus="status">
				<input type="hidden" name="uList[${status.index}].userId" value="${student.userId}">
				<input type="hidden" name="uList[${status.index}].identifiedNum" value="${student.identifiedNum}">
				<tr>
					<td>${student.userName}</td>
					<td>${student.identifiedNum}</td>
					<td>
					<select name="uList[${status.index}].permit">
						<option style="color:red;" value="-1" ${student.permit == -1 ? 'selected' : ''}>승인거부</option>
						<option value="0" ${student.permit == 0 ? 'selected' : ''}>승인대기</option>
						<option style="color:blue;" value="1" ${student.permit == 1 ? 'selected' : ''}>승인허가</option>
					</select>
					</td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="저장">
	</form>
	</p>
	
	
	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>