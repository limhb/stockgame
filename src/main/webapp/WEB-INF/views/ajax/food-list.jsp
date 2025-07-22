<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>메뉴</th>
		<th>가격</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>

<script>
function getFoods(){
	const chr = new XMLHttpRequest();
	xhr.open('GET' , '/foods');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4 ){
			if(xhr.status === 200){
				const foods = JSON.parse(xhr.reponseText);
				var html = '';
				for(const food of foods){
					html += '<tr>';
					html += '<td>' + user.uiNum + '</td>';
					html += '<td><a href="/views/ajax/food-view?fiNum=' + food.fiNum +'" >' + food.fiName + '</a></td>';
					html += '<td>' + user.uiName + '</td>';
					html += '</tr>';
					
				}
				document.querySelector('#tBody').innerHTML = html;
				
			}
		}
		
	}
	xhr.send();
}
window.onload = function(){
	getFoods();
	
}
</script>

</body>
</html>