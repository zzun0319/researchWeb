<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link href="resources/css/styles.css" rel="stylesheet" />

</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="/">EasyResearch</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    	<c:if test="${user == null}">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/user/login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/user/register">회원가입</a></li>
                        </c:if>
                        <c:if test="${user != null}">
                        	<c:choose>
                        		<c:when test="${user.memberType == 1}">
                        			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">연구 참여 신청하기</a></li>
                        		</c:when>
                        		<c:when test="${user.memberType == 2}">
                        			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">연구 개설 신청하기</a></li>
                       				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">연구 목적 외 장소 예약하기</a></li>                        		
                        		</c:when>
                        		<c:otherwise>
                         			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">연구 참여 과목 설정하기</a></li>
                       				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">연구 참여 점수 출력하기</a></li>                       		
                        		</c:otherwise>
                        	</c:choose>
                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">로그아웃</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="bg-primary text-white">
            <div class="container text-center">
                <h1>EasyResearch에 방문해주셔서 감사합니다.</h1>
                <p class="lead">EasyResearch는 연구자, 연구참여자 모두 간편하게 사용할 수 있는 연구 서포트 웹입니다.</p>
            </div>
        </header>

</body>
</html>