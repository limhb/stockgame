<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header"
	class="header d-flex align-items-center light-background sticky-top">
	<div
		class="container-fluid position-relative d-flex align-items-center justify-content-between">
		<a href="/game/play"
			class="logo d-flex align-items-center me-auto me-xl-0">
			<h1 class="sitename">GAME</h1>
		</a>

		<div class="header-social-links">
			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="/">Home</a></li>
					<li><a href="/game/play">Game</a></li>
					<li><a href="/views/board/board-list">Board</a></li>
					<li><a href="/game/result">Ranking</a></li>

					<!-- 로그인 여부에 따라 마이페이지 or 로그인/회원가입 보여줌 -->
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<li class="dropdown"><a href="#"><span>MyPage</span> <i
									class="bi bi-chevron-down toggle-dropdown"></i></a>
								<ul>
									<li><a href="/user/history">내 기록 확인</a></li>
									<li><a href="/user/password-check">정보 수정</a></li>
								</ul></li>
							<li><a href="#" onclick="logout(); return false;">Logout</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/user/login">Login</a></li>
							<li><a href="/views/user/join">Join</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>
		</div>
	</div>
	<script>
		function logout() {
			const form = document.createElement('form');
			form.method = 'POST';
			form.action = '/users/logout';
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</header>