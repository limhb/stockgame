<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세화면</title>
</head>
<body>
<h3>메뉴 상세화면</h3>

<table border="1">
    <tr>
        <th>번호</th>
        <td data-col="fiNum"></td>
    </tr>
    <tr>
        <th>메뉴명</th>
        <td data-col="fiName"></td>
    </tr>
    <tr>
        <th>가격</th>
        <td data-col="fiPrice"></td>
    </tr>    
    
    <tr>
    	<th colspan="2">
    		<button onclick="location.href='/views/ajax/food-update?fiNum=${param.fiNum}'">수정</button>
    		<button onclick="deleteFood()">삭제</button>
    	</th>
    </tr>
</table>

<script>

const fiNum = '${param.fiNum}';
function delete Food(){
    
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '/foods/' + fiNum);
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            if(xhr.status === 200){
            	if(xhr.responseText === '1'){
            		alert('정상삭제!');
            		location.href='/views/ajax/food-list'
            		}
            	}
            }
    }
    xhr.send();
}
function getFood(){
    
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '/foods/' + fiNum);
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            if(xhr.status === 200){
                const food = JSON.parse(xhr.responseText); 
                for(const key in food){
                    document.querySelector('[data-col=' + key + ']').innerHTML = food[key];
                }
            }
        }
    }
    xhr.send();
}

window.onload = function(){
    getFood();
}
</script>

</body>
</html>
