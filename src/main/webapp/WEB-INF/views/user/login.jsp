<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <title>Chart Game - 로그인</title>
    <style>
        /* 전체 배경 */
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }

        /* 로그인 카드 스타일 */
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            padding: 20px;
        }

        /* Chart Game 타이틀 */
        .title {
            font-size: 32px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* 버튼 스타일 */
        .btn-custom {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            transition: 0.3s ease-in-out;
        }

        /* 로그인 버튼 */
        .btn-login {
            background-color: #555;
            color: white;
        }

        .btn-login:hover {
            background-color: #333;
        }

        /* 회원가입 버튼 */
        .btn-register {
            background-color: #ddd;
            color: #333;
        }

        .btn-register:hover {
            background-color: #bbb;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <h1 class="title">Chart Game</h1>
                    <div class="card-body">
                        <form id="loginForm" action="/users/login" method="post" onsubmit="return validation()">
                            <div class="form-group">
                                <label for="uiId">아이디</label>
                                <input type="text" class="form-control" id="uiId" name="uiId" placeholder="아이디" required />
                            </div>
                            <div class="form-group">
                                <label for="uiPwd">비밀번호</label>
                                <input type="password" class="form-control" id="uiPwd" name="uiPwd" placeholder="비밀번호" required />
                            </div>
                            <button type="submit" class="btn btn-custom btn-login">로그인</button>
                        </form>
                        <p class="mt-3 text-center">
                            계정이 없으신가요?
                            <a href="/views/user/join" class="btn btn-custom btn-register mt-2 d-block">회원가입</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function validation() {
            const uiId = document.querySelector('#uiId');
            const uiPwd = document.querySelector('#uiPwd');
            
            if(uiId.value.trim().length < 4) {
                alert('아이디는 4글자 이상입니다.');
                uiId.focus();
                return false;
            }
            
            if(uiPwd.value.trim().length < 4) {
                alert('비밀번호는 4글자 이상입니다.');
                uiPwd.focus();
                return false;
            }
            
            return true;
        }
    </script>
</body>

</html>
