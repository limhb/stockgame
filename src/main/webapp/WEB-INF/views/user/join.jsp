<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <title>Chart Game - 회원가입</title>
    <style>
        /* 전체 배경 */
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }

        /* 카드 스타일 */
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            padding: 20px;
        }

        /* 타이틀 */
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

        /* 회원가입 버튼 */
        .btn-register {
            background-color: #555;
            color: white;
        }

        .btn-register:hover {
            background-color: #333;
        }

        .btn-login {
            background-color: #ddd;
            color: #333;
        }

        .btn-login:hover {
            background-color: #bbb;
        }

        /* 에러 메시지 */
        .error {
            color: red;
            font-size: 12px;
        }

        /* 아이디 중복확인 버튼 스타일 */
        .id-check-container {
            display: flex;
            gap: 10px;
        }
        .id-check-container input {
            flex: 1;
        }
        .id-check-btn {
            background-color: #555;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .id-check-btn:hover {
            background-color: #333;
        }
        #idCheckResult {
            margin-top: 5px;
            font-size: 12px;
        }
        #idCheckResult.available {
            color: green;
        }
        #idCheckResult.unavailable {
            color: red;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <h1 class="title">Chart Game - 회원가입</h1>
                    <div class="card-body">
                        <form id="registrationForm" action="/user" method="post" onsubmit="return validation()">
                            <div class="form-group">
                                <label for="uiId">아이디</label>
                                <div class="id-check-container">
                                    <input type="text" class="form-control" id="uiId" name="uiId" placeholder="아이디 (4자 이상)" />
                                    <button type="button" class="id-check-btn" onclick="checkId()">중복확인</button>
                                </div>
                                <div id="idCheckResult"></div>
                                <span id="uiIdError" class="error"></span>
                            </div>

                            <div class="form-group">
                                <label for="uiPwd">비밀번호</label>
                                <input type="password" class="form-control" id="uiPwd" name="uiPwd" placeholder="비밀번호 (4자 이상)" />
                                <span id="uiPwdError" class="error"></span>
                            </div>

                            <div class="form-group">
                                <label for="uiName">이름</label>
                                <input type="text" class="form-control" id="uiName" name="uiName" placeholder="이름" />
                            </div>

                            <div class="form-group">
                                <label for="uiNickName">닉네임</label>
                                <input type="text" class="form-control" id="uiNickName" name="uiNickName" placeholder="닉네임" />
                            </div>

                            <div class="form-group">
                                <label for="uiEmail">이메일</label>
                                <input type="email" class="form-control" id="uiEmail" name="uiEmail" placeholder="이메일" />
                            </div>

                            <div class="form-group">
                                <label for="uiPhone">전화번호</label>
                                <input type="text" class="form-control" id="uiPhone" name="uiPhone" placeholder="전화번호" />
                            </div>

                            <div class="form-group">
                                <label for="uiAddr1">주소</label>
                                <input type="text" class="form-control" id="uiAddr1" name="uiAddr1" placeholder="주소" />
                            </div>

                            <div class="form-group">
                                <label for="uiAddr2">상세 주소</label>
                                <input type="text" class="form-control" id="uiAddr2" name="uiAddr2" placeholder="상세 주소" />
                            </div>
                            <div class="form-group">
                                <label for="uiAddr2">우편주소</label>
                                <input type="text" class="form-control" id="uiZip" name="uiZip" placeholder="우편 주소" />
                            </div>
                            <div class="form-group">
                         <label for="uiGrade">등급</label>
                         <select class="form-control" id="uiGrade" name="uiGrade">
                            <option value="">등급 선택</option>
                             <option value="1">일반</option>
                             <option value="2">관리자</option>
                         </select>
                     </div>

                            <button type="submit" class="btn btn-custom btn-register" >회원가입</button>
                        </form>
                        <p class="mt-3 text-center">
                            계정이 있으신가요?
                            <a href="login" class="btn btn-custom btn-login mt-2 d-block">로그인</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let isIdChecked = false;
        let isIdAvailable = false;

        function checkId() {
            const uiId = $('#uiId').val();
            if(!uiId) {
                alert('아이디를 입력해주세요.');
                return;
            }

            $.ajax({
                url: '/user/check-id',
                type: 'GET',
                contentType: 'application/json',
                data: { uiId: uiId },
                success: function(res) {
                    isIdChecked = true;
                    isIdAvailable = res.available || res.usableID;
                    const resultDiv = $('#idCheckResult');
                    
                    if(res.available || res.usableID) {
                        resultDiv.text('사용 가능한 아이디입니다.').removeClass('unavailable').addClass('available');
                    } else {
                        resultDiv.text('이미 사용 중인 아이디입니다.').removeClass('available').addClass('unavailable');
                    }
                },
                error: function() {
                    alert('아이디 중복 확인 중 오류가 발생했습니다.');
                }
            });
        }

        function validation() {
            const uiId = document.querySelector('#uiId');
            const uiPwd = document.querySelector('#uiPwd');
            const uiName = document.querySelector('#uiName');

            // 아이디 유효성 검사 (4글자 이상)
            if (uiId.value.trim().length < 4) {
                document.querySelector('#uiIdError').innerText = '아이디는 4자 이상이어야 합니다.';
                uiId.focus();
                return false;
            } else {
                document.querySelector('#uiIdError').innerText = '';
            }

            // 아이디 중복 확인 체크
            if (!isIdChecked) {
                alert('아이디 중복 확인을 해주세요.');
                return false;
            }
            if (!isIdAvailable) {
                alert('이미 사용 중인 아이디입니다.');
                return false;
            }

            // 비밀번호 유효성 검사 (4글자 이상)
            if (uiPwd.value.trim().length < 4) {
                document.querySelector('#uiPwdError').innerText = '비밀번호는 4자 이상이어야 합니다.';
                uiPwd.focus();
                return false;
            } else {
                document.querySelector('#uiPwdError').innerText = '';
            }

            // 이름 유효성 검사
            if (uiName.value.trim().length === 0) {
                alert('이름을 입력해주세요.');
                uiName.focus();
                return false;
            }

            return true;
        }
    </script>
</body>

</html>
