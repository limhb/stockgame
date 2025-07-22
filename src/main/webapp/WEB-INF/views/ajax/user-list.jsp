<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트</title>
</head>
<body>
<h3>유저리스트</h3>
<input type="text" id="uiName" placeholder="이름"><button onclick="getUserList()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
	</tr>	
	<tbody id="tBody"></tbody>	
</table>

<script>
function getUserList() {
	const uiName = document.querySelector('#uiName');
	document.querySelector('#tBody').inner
	const xhr = new XMLHttpRequest();
	xhr.open('GET', '/users');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				const users = JSON.parse(xhr.responseText);
				var html = ''; // 변수명 수정 및 초기화
				for (const user of users) {
					html += '<tr>';
					html += '<td>' + user.uiNum + '</td>';
					html += '<td>' + user.uiId + '</td>';
					html += '<td>' + user.uiName + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html; // querySelector 오타 수정
			}
		}
	};
	xhr.send(); // 요청 전송 추가
}

// 페이지 로드 시 유저 리스트 가져오기
window.onload = getUserList;
</script>

</body>
</html>
