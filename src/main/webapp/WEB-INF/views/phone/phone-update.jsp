<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 수정</title>
<script src="/resources/jquery-3.7.1.js"></script>
</head>
<body>
<h3>휴대폰 수정</h3>

<input type="hidden" id="piNum">
<input type="text" id="piName" placeholder="이름"><br>
<input type="text" id="piPrice" placeholder="가격"><br>
<input type="text" id="piVendor" placeholder="제조사"><br>
<button onclick="updatePhone()">수정</button>

<script>
function updatePhone(){
    const xhr = new XMLHttpRequest();
    xhr.open('PUT', '/phones');
    xhr.setRequestHeader('Content-Type', 'application/json');
    
    const param = {
        piNum: document.querySelector('#piNum').value,
        piName: document.querySelector('#piName').value,
        piPrice: document.querySelector('#piPrice').value,
        piVendor: document.querySelector('#piVendor').value
    };

    xhr.send(JSON.stringify(param));
}
</script>

</body>
</html>
