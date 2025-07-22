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
<button onclick="insertFood()">추가</button>

<script>
function insertFood(){
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/foods');
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){ 
            if(xhr.status === 200){
                console.log(xhr.responseText);
                if(xhr.responseText === '1'){
                    alert('정상 입력 되었습니다.');
                    location.href='/views/ajax/food-list';
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
</script>
</body>
</html>
