<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<style>
    body {
        font-family: Arial, sans-serif;
        padding: 30px;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 400px;
        margin: auto;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
    }
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        width: 100%;
        padding: 10px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #555;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>정보 수정 - 본인 확인</h2>
        <form method="post" action="/user/password-check">
            <label for="uiPwd">비밀번호 입력:</label>
            <input type="password" id="uiPwd" name="uiPwd" required autocomplete="off" />
            <button type="submit">확인</button>
        </form>
    </div>
</body>
</html>
