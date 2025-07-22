<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가</title>
</head>
<body>
<h3>메뉴 추가</h3>

<input type="text" id="fiName" placeholder="메뉴명"><br>
<input type="text" id="fiPrice" placeholder="가격"><br>
<button onclick="insertFood()">수정</button>

<script>
const fiNum = '${param.fiNum}';
function updateFood(){
    const xhr = new XMLHttpRequest();
    xhr.open('PUT', '/foods' + fiNum);
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){ 
            if(xhr.status === 200){
                console.log(xhr.responseText);
                if(xhr.responseText === '1'){
                    alert('정상 수정 되었습니다.');
                    location.href='/views/ajax/food-view?fiNum' + fiNum; 
                }
            }
        }
    }
    const param = {
        fiName : document.querySelector('#fiName').value, 
        fiPrice : document.querySelector('#fiPrice').value,
    };
    const json = JSON.stringify(param);
    xhr.setRequestHeader('Content-Type', 'application/json'); 
    xhr.send(json);
}

function getFood(){
    
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '/foods/' + fiNum);
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            if(xhr.status === 200){
                const food = JSON.parse(xhr.responseText); 
                for(const key in food){
                	if(  document.querySelector('#' + key) !== null){
                    document.querySelector('#' + key).value = food[key];
                	}
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
