<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 목록</title>
<script src="/resources/jquery-3.7.1.js"></script>
</head>
<body>
	<h3>휴대폰 목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>휴대폰명</th>
			<th>가격</th>
			<th>브랜드</th>
		</tr>
		<tbody id="tBody"></tbody>
	</table>

	<script>
	// 변수명은 영문 소문자
	// 특문 숫자는 첫글자로 불가
	// 단 특문 중 $, _ 는 예외
	
	function getPhones() {
		$.ajax({
			method: 'GET',
			url: '/phones',
			success: function(phones) {
				let html = '';
				for (const phone of phones) {
					html += '<tr>';
					html += '<td>' + phone.piNum + '</td>';
					html += '<td><a href="/views/phone/phone-view?piNum=' + phone.piNum + '">' + phone.piName + '</a></td>';
					html += '<td>' + phone.piPrice + '</td>';
					html += '<td>' + phone.piVendor + '</td>';
					html += '</tr>';
				}
				$('#tBody').html(html);
			},
			error: function(xhr, status, error) {
				console.error('AJAX 오류:', status, error);
			}
		});
		
	}

	// 문서 로드 후 실행
	$(document).ready(function() {
		getPhones();
	});
	</script>
</body>
</html>
