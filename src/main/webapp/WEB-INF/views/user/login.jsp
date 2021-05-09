<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />

</head>
<body>

	<jsp:include page="../include/header.jsp" />
	
	<div class="container">
		<p>
		<h2>로그인 페이지입니다.</h2>
		</p>
		<p>
		<form action="post">
			<table>
				<tr>
					<td>회원분류</td>
					<td>
						<select name="memberType">
							<option value="1">학부생</option>
							<option value="2">대학원생</option>
							<option value="3">강사</option>
							<option value="4">지도교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" placeholder="아이디를 입력하세요." /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw" placeholder="비밀번호를 입력하세요." /></td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="submit" value="로그인">
					</td>
				</tr>
			</table>
		</form>
		</p>
		
		
	</div>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>