<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이머 테스트</title>

<script src="/resources/jquery-3.7.1.js"></script>

<style>
    body { font-size: 24px; text-align: center; margin-top: 100px; background-color: black; color: white; }
    #timer { color: red; font-size: 50px; font-weight: bold; }
</style>
</head>

<body>

<h2>5분 타이머 테스트 화면</h2>

<div>남은 시간 : <span id="timer">05:00</span></div>

<script>
// 제한 시간 5분 = 300초
let timeLeft = 300; 
let counter = 0;  
let timerInterval;

// 초를 분:초 포맷으로 변환
function convertSeconds(s) {
    let min = String(Math.floor(s / 60)).padStart(2, '0');
    let sec = String(s % 60).padStart(2, '0');
    return min + ':' + sec;
}

// 타이머 실행 함수
function startTimer() {
    console.log("=== 타이머 시작 ===");

    $('#timer').text(convertSeconds(timeLeft - counter));

    timerInterval = setInterval(function() {
        counter++;

        if (counter > timeLeft) {
            clearInterval(timerInterval);
            $('#timer').text("시간 종료");
            console.log("=== 타이머 종료 ===");
            return;
        }

        $('#timer').text(convertSeconds(timeLeft - counter));

    }, 1000);
}

// 페이지 로드 후 실행
$(document).ready(function() {
    console.log("=== 페이지 로드 완료 ===");
    startTimer();
});
</script>

</body>
</html>
