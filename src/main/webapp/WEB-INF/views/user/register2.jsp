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
					<td>
					</td>
					<td>
						<div><span id="pwChk"></span></div>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td id="rightColumn">
						<input style="width:60%;"  type="password" id="pw_again" placeholder="위의 비밀번호와 똑같이 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<div><span id="pwAgainChk"></span></div>
					</td>
				</tr>
				<tr>
					<td>학번 / 교번</td>
					<td id="rightColumn">
						<input style="width:60%;" type="text" name="identifiedNum" id="id_num" placeholder="9자의 학번 또는 교번을 입력하세요."> &nbsp; &nbsp;
						<input type="button" id="idNumCheck" value="학번/교번 중복체크">
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<div><span id="idNumChk"></span></div>
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
	$(function() { // 검증 함수 시작
		
		const getIdCheck = RegExp(/^[a-zA-z0-9]{6,14}$/); // 따옴표(/), 적용 시작(^), 적용 끝($), [허용되는 것: 영문 대소문자 & 숫자, 띄어쓰기 불가능]{최소, 최대}
		
		const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,_,~])|([!,@,#,$,%,^,&,*,_,~].*[a-zA-Z0-9]){8,20}/); // a.(a로 시작하는 것들) .n(n으로 끝나는 것들) / *(반복가능), 
		// 영문 대소문자 & 숫자 포함한 걸로 시작(.), 반복 가능(*), 특수문자 포함해야함.
		
		const getIdNumCheck = RegExp(/^[0-9]{9}$/); // 9자리의 학번만 입력 가능, ex 201521421
		
		const getNameCheck = RegExp(/^[a-zA-Z가-힣\s]$/); // 영문 대소문자, 한글 가능, 띄어쓰기 가능
		
		const getEmailCheck = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/); // 이메일 형식만 가능
		
		const getPhoneNum = RegExp(/^[0-9]{2,3}-[0,9]{3,4}-[0,9]{4}$/); // 000-0000-0000 형태만 가능
		
		
		
		
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false;
		// chk1: 아이디 체크, chk2: 비밀번호 체크, chk3: 학번 체크, chk4: 이름 체크, chk5: 이메일 체크, chk6: 휴대폰 번호 체크
		
		$("#user_id").keyup(function() { // ID 입력값 검증
			if($("#user_id").val() === ""){
				$("#user_id").css("background-color","pink");
				$("#idChk").html("<b style='font-size: 14px; color: red;'>아이디는 필수 정보입니다.</b>");
				chk1 = false;
			}
			else if(!getIdCheck.test($("#user_id").val())){
				$("#user_id").css("background-color","pink");
				$("#idChk").html("<b style='font-size: 14px; color: red;'>아이디는 6 ~ 14자의 영문대소문자와 숫자로만 이뤄져야하고 공백이 없어야 합니다.</b>");
				chk1 = false;
			} else {
				$("#user_id").css("background-color","white");
				$("#idChk").html("<b style='font-size: 14px; color: green;'>조건 만족. 중복 체크를 완료하세요 :) </b>");
				
				$("#idCheck").click(function() { // id 중복확인
					
					$.ajax({ 
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
				})// id 중복확인
				
			} // else
		}) // ID 입력값 검증
		
		////////////////////////////////////////////////////////
		
		$("#user_pw").keyup(function() { // 비밀번호 입력값 검증
			
			if($("#user_pw").val() === ""){
				$("#user_pw").css("background-color", "pink");
				$("#pwChk").html("<b style='font-size: 14px; color: red;'>비밀번호는 필수 입력사항입니다.</b>");
				chk2 = false;
			} 
			else if(!getPwCheck.test($("#user_pw").val())){
				$("#user_pw").css("background-color","pink");
				$("#pwChk").html("<b style='font-size: 14px; color: red;'>비밀번호는 8 ~ 20자의 영문대소문자와 특수문자의 조합이 필수입니다.</b>");
				chk2 = false;
			}
			else {
				$("#user_pw").css("background-color","white");
				$("#pwChk").html("<b style='font-size: 14px; color: green;'>조건 만족. 아래에 비밀번호를 한 번 더 입력해주세요 :) </b>");
				
				$("#pw_again").keyup(function() { // 비밀번호 확인란
					if($("#pw_again").val() === ""){
						$("#pw_again").css("background-color", "pink");
						$("#pwAgainChk").html("<b style='font-size: 14px; color: red;'>비밀번호 재입력은 필수 입력사항입니다.</b>");
						chk2 = false;
					} 
					else if($("#pw_again").val() != $("#user_pw").val()){
						$("#pw_again").css("background-color", "pink");
						$("#pwAgainChk").html("<b style='font-size: 14px; color: red;'>위의 비밀번호와 불일치합니다.</b>");
						chk2 = false;
					}
					else{
						$("#user_pw").css("background-color", "skyblue");
						$("#pw_again").css("background-color", "skyblue");
						$("#pwAgainChk").html("<b style='font-size: 14px; color: green;'>비밀번호 확인 완료.</b>");
						chk2 = true;
					}
				})// 비밀번호 확인란
				
			}
				
				
		})// 비밀번호 입력값 검증
		
		//////////////////////////////////////////v
		
		$("#id_num").keyup(function() { // 학번 입력값 검증
			
			if($("#id_num").val() === ""){
				$("#id_num").css("background-color", "pink");
				$("#idNumChk").html("<b style='font-size: 14px; color: red;'>학번/교번은 필수 입력사항입니다.</b>");
				chk3 = false;
			}
			else if(!getIdNumCheck.test($("#id_num").val())){
				$("#id_num").css("background-color", "pink");
				$("#idNumChk").html("<b style='font-size: 14px; color: red;'>학번/교번은 9자리의 숫자입니다.</b>");
				chk3 = false;
			}
			else{
				$("#id_num").css("background-color","white");
				$("#idNumChk").html("<b style='font-size: 14px; color: green;'>조건 만족. 중복 체크를 완료하세요 :) </b>");
		
				$("#idNumCheck").click(function() { // 학번 중복확인
					
					$.ajax({
						
						type: "POST",
						url: "/user/checkIdNum",
						data: {
							idNum : $("#id_num").val()
						},
						success: function(result2) {
							console.log("통신 성공!: " + result2);
							if(result2 === "OK"){
								$("#id_num").css("background-color", "skyblue");
								$("#idNumChk").html("<b style='font-size: 14px; color: green;'>사용 가능한 학번/교번입니다.</b>");
								chk3 = true;
							}
							else {
								$("#id_num").css("background-color", "pink");
								$("#idNumChk").html("<b style='font-size: 14px; color: red;'>이미 사용중인 학번/교번입니다.</b>");
								chk3 = false;
							}
						},
						error: function() {
							console.log("통신 실패!");
						}
						
					})// ajax
					
				}) // 학번 중복확인
		
			} // else
			
		}) // 학번 입력값 검증
		
	}) // 검증 함수 끝
</script>
