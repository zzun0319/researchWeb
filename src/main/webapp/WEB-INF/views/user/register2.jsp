<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

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
						<input style="width:60%;" type="text" name="userId" id="user_id" placeholder="아이디를 6자 ~ 14자의 영문대소문자와 숫자로 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="idCheck" value="아이디 중복체크">
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<div><span id="idChk"></span></div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td id="rightColumn">
						<input style="width:60%;"  type="password" name="userPw" id="user_pw" placeholder="비밀번호를 입력하세요. 8자 ~ 20자, 영문, 숫자, 특수문자 조합">
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td id="rightColumn">
						<input style="width:60%;"  type="password" name="pwCheck" id="pw_check" placeholder="위의 비밀번호와 똑같이 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td>학번 / 교번</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="identifiedNum" id="id_num" placeholder="9자의 학번 또는 교번을 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="idNumCheck" value="학번/교번 중복체크">
					</td>
				</tr>
				<c:if test="${memberType=='지도교수'}">
					<tr>
						<td>전공</td>
						<td id="rightColumn">
							<input style="width:60%;" type="text" name="major" id="majorCheck" placeholder="전공을 입력하세요.">
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
						<input  style="width:60%;" type="text" name="userName" id="user_name" placeholder="이름을 입력하세요.">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="email" id="user_email" placeholder="이메일을 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="emailCheck" value="인증확인 메일 보내기">
					</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="phoneNum" id="user_phoneNum" placeholder="휴대폰 번호를 입력하세요."> &nbsp; &nbsp;
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

<script type="text/javascript">
	$(function() {
		
		const getIdCheck = RegExp(/^[a-zA-z0-9]{6,14}$/); // 따옴표(/), 적용 시작(^), 적용 끝($), [허용되는 것: 영문 대소문자 & 숫자, 띄어쓰기 불가능]{최소, 최대}
		
		const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,_,~])|([!,@,#,$,%,^,&,*,_,~].*[a-zA-Z0-9]){8,20}/); // a.(a로 시작하는 것들) .n(n으로 끝나는 것들) / *(반복가능), 
		// 영문 대소문자 & 숫자 포함한 걸로 시작(.), 반복 가능(*), 특수문자 포함해야함.
		
		const getNameCheck = RegExp(/^[a-zA-Z가-힣\s]$/); // 영문 대소문자, 한글 가능, 띄어쓰기 가능
		
		const getEmailCheck = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/); // 이메일 형식만 가능
		
		const getPhoneNum = RegExp(/^[0-9]{2,3}-[0,9]{3,4}-[0,9]{4}$/); // 000-0000-0000 형태만 가능
		
		const getIdNumCheck = RegExp(/^[0-9]{9}$/) // 9자리의 학번만 입력 가능, ex 201521421
		
		
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false;
		
		$("#user_id").keyup(function() { // ID 입력값 검증
			if($(this).val() === ""){
				$(this).css("background-color","pink");
				$("#idChk").html("<b style='color: red;'>아이디는 필수 정보입니다.</b>");
				chk1 = false;
			}
			else if(!getIdCheck.test($(this).val())){
				$(this).css("background-color","pink");
				$("#idChk").html("<b style='color: red;'>아이디는 6 ~ 14자의 영문대소문자와 숫자로만 이뤄져야 합니다.</b>");
				chk1 = false;
			} else {
				$(this).css("background-color","white");
				$("#idChk").html("<b style='color: green;'>조건 만족. 중복 체크를 완료하세요 :) </b>");
				
				$("#idCheck").click(function() {
					
					$.ajax({ // ajax
						type: "POST",
						url: "/user/checkId",
						data: {
							id : $("#user_id").val()
						},
						success: function(result) {
							console.log("통신 성공!: " + result);
							if(result === "OK"){
								$("#user_id").css("background-color", "skyblue");
								$("#idChk").html("<b style='font-size: 14px; color: green;'>사용 가능한 아이디입니다.</b>");
								chk1 = true;
							}
							else {
								$("#user_id").css("background-color", "pink");
								$("#idChk").html("<b style='font-size: 14px; color: red;'>이미 사용중인 아이디입니다.</b>");
								chk1 = false;
							}
						},
						error: function() {
							console.log("통신 실패!");
						}
						
					}); // ajax
				})
				
			} // else
		}) // ID 입력값 검증
		
		
	})
</script>
