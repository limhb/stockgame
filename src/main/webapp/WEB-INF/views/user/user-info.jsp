<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    Object loginUser = session.getAttribute("loginUser");
    out.println("세션 loginUser: " + loginUser);
%>
<html>
<head>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<title>회원정보</title>

<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	margin: 0;
}

.page-wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 100px;
}

.info-container {
	background-color: #fff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	width: 500px;
	margin-bottom: 50px;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

.info-group {
	margin-bottom: 15px;
}

.info-label {
	font-weight: bold;
	display: block;
	margin-bottom: 6px;
	color: #333;
}

.info-value {
	padding: 10px;
	background-color: #f2f2f2;
	border-radius: 6px;
}

.board-list-container {
	width: 90%;
	max-width: 800px;
	background-color: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.board-list-container h3 {
	margin-bottom: 20px;
}

.board-table {
	width: 100%;
	border-collapse: collapse;
}

.board-table th, .board-table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.board-table th {
	background-color: #f0f0f0;
}

.btn-edit {
	display: inline-block;
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	border-radius: 6px;
	transition: background-color 0.3s;
}

.btn-edit:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="page-wrapper">
		<div class="info-container">
			<h2>회원 정보</h2>

			<!-- 사용자 정보 출력 -->
			<div class="info-group">
				<span class="info-label">아이디:</span>
				<div class="info-value">${user.uiId}</div>
			</div>
			<div class="info-group">
				<span class="info-label">이름:</span>
				<div class="info-value">${user.uiName}</div>
			</div>
			<div class="info-group">
				<span class="info-label">닉네임:</span>
				<div class="info-value">${user.uiNickName}</div>
			</div>
			<div class="info-group">
				<span class="info-label">주소:</span>
				<div class="info-value">${user.uiAddr1}${user.uiAddr2}</div>
			</div>
			<div class="info-group">
				<span class="info-label">우편번호:</span>
				<div class="info-value">${user.uiZip}</div>
			</div>
			<div class="info-group">
				<span class="info-label">전화번호:</span>
				<div class="info-value">${user.uiPhone}</div>
			</div>
			<div class="info-group">
				<span class="info-label">이메일:</span>
				<div class="info-value">${user.uiEmail}</div>
			</div>
			<div class="info-group">
				<span class="info-label">등급:</span>
				<div class="info-value">
					<c:choose>
						<c:when test="${user.uiGrade == 1}">일반</c:when>
						<c:when test="${user.uiGrade == 2}">관리자</c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- 정보 수정 버튼 (본인일 경우만 출력) -->
			<c:if test="${sessionScope.loginUser.uiNum == user.uiNum}">
				<div style="text-align: center; margin-top: 30px;">
					<a href="/user/password-check" class="btn-edit">정보 수정</a>
				</div>
			</c:if>
		</div>

	<%-- 	<!-- 내가 쓴 글 목록 -->
		<div class="board-list-container">
			<h3>내가 쓴 글 목록</h3>
			<c:choose>
				<c:when test="${empty boardList}">
					<p>작성한 게시글이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<table class="board-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td>${board.biNum}</td>
									<td><a href="/board/view?biNum=${board.biNum}">${board.biTitle}</a></td>
									<td>${board.credat}</td>
									<td>${board.biReadCnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div> --%>

</body>
</html>
