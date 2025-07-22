<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/jquery-3.7.1.js"></script>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<td data-col="piNum"></td>
	</tr>
	<tr>
		<th>휴대폰명</th>
		<td data-col="piName"></td>
	</tr>
	<tr>
		<th>가격</th>
		<td data-col="piPrice"></td>
	</tr>
	<tr>
		<th>제조사</th>
		<td data-col="piVendor"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button>수정</button>
			<button onclick="deletePhone()">삭제</button>
		</th>
	</tr>
</table>
<script>
const piNum = '${param.piNum}';

function deletePhone(){
	$.ajax({
		method : 'DELETE',
		url : '/phones/' + piNum,
		success : function(res){
			if(res === 1){
				alert('삭제 완료');
				location.href='/views/phone/phone-list';
			}
			
		}
	})
}
function getPhone(){
	$.ajax({
		method : 'GET',
		url : '/phones/' + piNum,
		success : function(phone){
			for(const key in phone){
				if(document.querySelector('[data-col=' + key + ']')){
					document.querySelector('[data-col=' + key + ']').innerHTML = phone[key];
				}
			}
		}
	});

}
window.onload = function(){
	getPhone();
}
</script>
</body>
</html>