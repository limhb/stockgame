<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<title>회원정보 수정</title>

<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	margin: 0;
}

.page-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: calc(100vh - 80px); /* header 높이만큼 빼기 */
}

.form-container {
	background-color: #fff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	width: 500px;
	margin-top: 100px;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 6px;
	font-weight: bold;
}

input[type="text"], input[type="password"], input[type="email"], select,
	textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
}

textarea {
	resize: vertical;
	height: 100px;
}

.button-group {
	margin-top: 25px;
	display: flex;
	justify-content: space-between;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
}

button[type="submit"] {
	background-color: #4CAF50;
	color: white;
}

button[type="button"] {
	background-color: #ccc;
	color: black;
}

button.delete-btn {
	background-color: #e74c3c;
	color: white;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp"%>
<div style="margin-top: 90px;"></div>
<div class="page-wrapper">
	<div class="form-container">
		<h2>회원정보 수정</h2>

		<form action="/user/mypage-update" method="post">
			<input type="hidden" name="uiNum" value="${user.uiNum}" />

			<div class="form-group">
				<label>아이디:</label> <input type="text" name="uiId"
					value="${user.uiId}" readonly />
			</div>

			<div class="form-group">
				<label>비밀번호:</label> <input type="password" name="uiPwd"
					value="${user.uiPwd}" />
			</div>

			<div class="form-group">
				<label>이름:</label> <input type="text" name="uiName"
					value="${user.uiName}" />
			</div>

			<div class="form-group">
				<label>닉네임:</label> <input type="text" name="uiNickName"
					value="${user.uiNickName}" />
			</div>

			<div class="form-group">
				<label>주소:</label> <input type="text" name="uiAddr1"
					value="${user.uiAddr1}" />
			</div>

			<div class="form-group">
				<label>상세주소:</label> <input type="text" name="uiAddr2"
					value="${user.uiAddr2}" />
			</div>

			<div class="form-group">
				<label>우편번호:</label> <input type="text" name="uiZip"
					value="${user.uiZip}" />
			</div>

			<div class="form-group">
				<label>전화번호:</label> <input type="text" name="uiPhone"
					value="${user.uiPhone}" />
			</div>

			<div class="form-group">
				<label>이메일:</label> <input type="email" name="uiEmail"
					value="${user.uiEmail}" />
			</div>

			<div class="form-group">
				<label for="uiGrade">등급</label> <select id="uiGrade" name="uiGrade"
					required>
					<option value="">등급 선택</option>
					<option value="1" <c:if test="${user.uiGrade == 1}">selected</c:if>>일반</option>
					<option value="2" <c:if test="${user.uiGrade == 2}">selected</c:if>>관리자</option>
				</select>
			</div>

			
				<div class="button-group">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='/'">취소</button>
					<button type="button" class="delete-btn" onclick="confirmDelete()">회원 탈퇴</button>
				</div>
				
			
			</form>
		</div>
	</div>
<script>
	function confirmDelete() {
		if (confirm("정말로 탈퇴하시겠습니까?")) {
			fetch('/users/delete?uiNum=${user.uiNum}', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				}
			})
			.then(response => response.json())
			.then(data => {
				if (data.status === 'success') {
					alert(data.message);  // 탈퇴 메시지 먼저 표시
					// 로그아웃 처리
					const logoutForm = document.createElement('form');
					logoutForm.method = 'POST';
					logoutForm.action = '/users/logout';
					document.body.appendChild(logoutForm);
					logoutForm.submit();
				} else {
					alert(data.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('처리 중 오류가 발생했습니다.');
			});
		}
	}
</script>
</body>
</html>
