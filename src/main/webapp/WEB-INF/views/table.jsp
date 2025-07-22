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
	<tbody id="tBody"></tbody>
</table>

<script>

var ranNums = [];
window.onload = function(){
	while(ranNums.length<9){
		const ranNum = Math.follr(Math.random()* 9) +1;
		if(!ranNums.includes(ranNum)){
			ranNums.push(ranNum);
		}
	}
	console.log(ranNums);
	var html = '';
	for(var i=0;i<3;i++){
		html += '<tr>';
		for(var j=0;j<3;j++){
			html += '<td>' + '</td>';
		}
		html += '</tr>';
	}
	document.querySelector('#tBody').innerHTML = html;
	
}
</script>
</body>
</html>