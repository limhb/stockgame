<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>

<body class="starter-page-page">

<%@ include file="/WEB-INF/views/include/header.jsp" %>

    <main class="main">
        <section id="hero" class="hero section">
            <img src="${pageContext.request.contextPath}/resources/img/chart4.jpg" alt="" data-aos="fade-in" class="aos-init aos-animate">
            
            <div class="container text-center aos-init aos-animate" data-aos="zoom-out" data-aos-delay="100">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h2>Chart Game</h2>
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <p>당신의 운을 시험해 보세요</p>
                                <a href="/game/play" class="btn-get-started">게임 하러 가기</a><br>
                                <a href="/game/guide" class="btn-get-started" style="margin: 10px 0;">게임 방법</a><br>
                                <form action="/users/logout" method="post">
                                    <button type="submit" class="btn-get-started btn-logout">로그아웃</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <p>로그인이 필요합니다</p>
                                <a href="/user/login" class="btn-get-started">로그인</a><br>
                                <a href="#" class="btn-get-started" onclick="return checkLogin();">게임 하러 가기</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>
    </main>

   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/main.js"></script>

<script>
function checkLogin() {
    alert("로그인이 필요합니다.");
    window.location.href = "/user/login"; 
    return false; 
}
</script>
</body>
</html>
