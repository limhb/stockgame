<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Ajax - test</h3>
<button onclick="getMap()">Map 가져오기</button>
<button onclick="getList()">List 가져오기</button>
<div id="rDiv1"></div>
<div id="rDiv2"></div>

<script>
function getMap(){
	var xhr = new XMLHttpRequest();
	xhr.open('/ajax/map');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				const data = JSON.parse(xhr.responseText);
				var html = '이름 : ' + data['이름'] + ', 나이 : ' + data['나이'];
				document.querySelector('#rDiv1').innerHTML = html;
			}
		}
	
	}
	xhr.send();
	alert(1);
}
function getList(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/ajax/list');
	xhr.onreadystatechange = function(){
		if(xhr.readyStatus === 4){
			if(xhr.status === 200){
				const data = JSON.parse(xhr.responseText);
				var html = '';
				for(var i =0;i<data.length;i++){
					html += data[i];
				}
				document.querySelector('#rDiv2').innerHTML = html;
				
			}
		}
	}
	
}
</script>
</body>
</html>