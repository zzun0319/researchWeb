<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>

<style type="text/css">
#rightColumn{
	width: 100%;
}
</style>

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
					<td id="rightColumn">
						<input name="memberType" value="${memberType}" disabled>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="userId" placeholder="아이디를 입력하세요. 8자 ~ 14자, 영문, 숫자, 특수문자 조합"> &nbsp; &nbsp;
						<input type="button" id="idCheck" value="아이디 중복체크">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td id="rightColumn">
						<input style="width:60%;"  type="password" name="userPw" placeholder="비밀번호를 입력하세요. 8자 ~ 20자, 영문, 숫자, 특수문자 조합">
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td id="rightColumn">
						<input style="width:60%;"  type="password" name="pwCheck" placeholder="위의 비밀번호와 똑같이 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td>학번 / 교번</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="identifiedNum" placeholder="9자의 학번 또는 교번을 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="idNumCheck" value="학번/교번 중복체크">
					</td>
				</tr>
				<c:if test="${memberType=='지도교수'}">
					<tr>
						<td>전공</td>
						<td id="rightColumn">
							<input style="width:60%;" type="text" name="major" placeholder="전공을 입력하세요.">
						</td>
					</tr>
				</c:if>
				<c:if test="${memberType=='대학원생'}">
					<tr>
						<td>전공</td>
						<td id="rightColumn">
							<select name="major">
									<option>===전공선택===</option>
								<c:forEach var="m" items="${majorList}">
									<option value="${m}">${m}</option>
								</c:forEach>
							</select>
						</td>
					</tr>				
				</c:if>
				<tr>
					<td>이름</td>
					<td id="rightColumn">
						<input  style="width:60%;" type="text" name="userName" placeholder="이름을 입력하세요.">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="email" placeholder="이메일을 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="emailCheck" value="인증확인 메일 보내기">
					</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="phoneNum" placeholder="휴대폰 번호를 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="phoneNumCheck" value="본인 인증하기">
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

<script>
	$(function() {
		
		
	})
</script>
