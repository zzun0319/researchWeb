<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>로그인 페이지입니다.</h2>
		</p>
		<p>
		<form method="post" name="login_form">
			<table>
				<tr>
					<td>회원분류</td>
					<td>
						<select name="memberType">
							<option> === 선택 === </option>
							<option value="학부생">학부생</option>
							<option value="대학원생">대학원생</option>
							<option value="강사">강사</option>
							<option value="지도교수">지도교수</option>
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

<script>
	const result = "${msg}"
	if(result != "로그인 성공" && result.length > 0){
		alert(result);
		// 이렇게 할 게 아니라 에러메시지별, 커서 갖다놓는 위치를 다르게 해야 해서 조건문 다 만들어줘야함.
	}


</script>