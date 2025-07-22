<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 가이드</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<style>
body {
    background-color: #f0f0f0;
    color: #333;
    font-family: 'Noto Sans KR', sans-serif;
}

.guide-container {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
    background: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 20px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.guide-title {
    font-size: 2rem;
    color: #333;
    margin-bottom: 1.5rem;
    text-align: center;
    border-bottom: 2px solid #40c9a2;
    padding-bottom: 1rem;
}

.guide-section {
    margin-bottom: 2rem;
    padding: 1.5rem;
    background-color: #f5f5f5;
    border-radius: 10px;
    border: 1px solid #e0e0e0;
}

.guide-section h3 {
    color: #40c9a2;
    margin-bottom: 1rem;
    font-size: 1.3rem;
}

.guide-section p {
    margin-bottom: 1rem;
    line-height: 1.6;
}

.guide-section ul {
    list-style-type: none;
    padding-left: 0;
}

.guide-section li {
    margin-bottom: 0.5rem;
    padding-left: 1.5rem;
    position: relative;
}

.guide-section li:before {
    content: "•";
    color: #40c9a2;
    position: absolute;
    left: 0;
}

.back-btn {
    display: inline-block;
    background-color: #40c9a2;
    color: white;
    padding: 0.8rem 2rem;
    border-radius: 30px;
    text-decoration: none;
    margin-top: 1rem;
    transition: all 0.3s ease;
}

.back-btn:hover {
    background-color: #35a88a;
    transform: translateY(-2px);
}

.important-note {
    background-color: rgba(64, 201, 162, 0.1);
    border-left: 4px solid #40c9a2;
    padding: 1rem;
    margin: 1rem 0;
    border-radius: 0 8px 8px 0;
}

.guide-section h4 {
    color: #0d6efd;
    margin-bottom: 1rem;
}

.text-danger {
    color: #dc3545;
}

.text-warning {
    color: #ffc107;
}
</style>
</head>
<body>
    <c:import url="/WEB-INF/views/include/header.jsp" />
    
    <div class="guide-container">
        <h1 class="guide-title">게임 가이드</h1>
        
        <div class="guide-section">
            <h3>게임 소개</h3>
            <p>가상의 돈으로 진짜 코인 시장을 체험해보세요!</p> 
            <p>실제 코인 가격을 보면서 여러분의 투자 감각을 시험해볼 수 있습니다.</p>
            <p>5분이라는 짧은 시간 동안 얼마나 많은 수익을 낼 수 있는지 도전해보세요. </p>
            <p>전문 투자자가 아니어도 누구나 쉽게 즐길 수 있습니다!</p>
        </div>
        
        <div class="guide-section">
            <h3>간단한 조작 방법</h3>
            <ul>
                <li>1. 거래할 코인을 선택하세요 (XRP, 비트코인, 이더리움 등)</li>
                <li>2. 투자 금액을 입력하세요 (또는 25%, 50%, 75%, 100% 버튼 이용)</li>
                <li>3. 레버리지를 선택하세요 (초보자는 x1~x5 권장)</li>
                <li>4. 가격이 오를 것 같으면 '롱 포지션' 버튼을, 내릴 것 같으면 '숏 포지션' 버튼을 클릭하세요</li>
                <li>5. 차트를 보며 적절한 타이밍에 '포지션 정리' 버튼을 눌러 거래를 종료하세요</li>
                <li>6. 남은 시간 안에 최대한 많은 수익을 올려보세요!</li>
            </ul>
        </div>
        
        <div class="guide-section">
            <h3>승리 조건</h3>
            <ul>
                <li>5분 동안 얼마나 많은 수익을 냈는지로 순위가 결정됩니다</li>
                <li>시작 금액인 100만원보다 많이 벌수록 좋은 성적을 거둘 수 있습니다</li>
                <li>상위 5등 안에 들면 랭킹에 이름을 올릴 수 있습니다!</li>
                <li>최종 금액이 많을수록 높은 점수를 받습니다</li>
            </ul>
        </div>
        
        <div class="guide-section">
            <h3>기본 용어 설명</h3>
            <ul>
                <li><strong>롱 포지션</strong>: 가격이 오를 것 같을 때 선택하는 매수 방식입니다. 가격이 오르면 수익이 납니다.</li>
                <li><strong>숏 포지션</strong>: 가격이 내릴 것 같을 때 선택하는 매도 방식입니다. 가격이 내리면 수익이 납니다.</li>
                <li><strong>레버리지</strong>: 내 돈보다 더 많은 금액으로 거래할 수 있게 해주는 일종의 '배율'입니다. 예를 들어 10만원에 x10 레버리지를 적용하면 100만원어치를 거래하는 효과가 있습니다.</li>
                <li><strong>청산</strong>: 가격이 크게 불리하게 움직여서 더 이상 거래를 유지할 수 없게 되는 상황입니다. 투자금의 대부분을 잃게 됩니다.</li>
                <li><strong>수수료</strong>: 포지션 진입, 종료시 진입,종료 금액의 0.05%를 청구합니다.(레버리지 x1 경우 포지션 진입,종료시 총 0.1% 청구) 레버리지가 높아지면 수수료도 그에 따라 높아집니다.(x10 레버리지 시 수수료 0.05% x 10 = 0.5%) 도파민 모드에선 수수료가 10배 더 부과됩니다.</li>
            </ul>
        </div>
        
        <div class="guide-section">
            <h3>레버리지 자세히 알아보기</h3>
            <p>레버리지는 여러분의 투자금에 곱하기를 해주는 배수입니다. 더 적은 돈으로 더 큰 금액을 거래할 수 있게 해줍니다.</p>
            
            <div class="important-note">
                <p><strong>예시로 이해하기:</strong></p>
                <p>10만원으로 x1 레버리지: 코인 가격이 10% 오르면 → 1만원 수익 (10만원의 10%)</p>
                <p>10만원으로 x10 레버리지: 코인 가격이 10% 오르면 → 10만원 수익 (100만원의 10%)</p>
                <p>10만원으로 x100 레버리지: 코인 가격이 10% 오르면 → 100만원 수익 (1000만원의 10%)</p>
            </div>
            
            <p>하지만 주의하세요! 레버리지는 수익뿐만 아니라 손실도 같은 배수로 커집니다. 높은 레버리지는 높은 위험을 의미합니다.</p>
            <ul>
                <li>x1: 가장 안전하지만 수익도 적습니다</li>
                <li>x2~x5: 적당한 위험과 수익의 균형</li>
                <li>x10~x50: 위험하지만 큰 수익 가능</li>
                <li>x100: 매우 위험! 작은 가격 변동에도 청산될 수 있습니다</li>
            </ul>
        </div>
        
        <div class="guide-section">
            <h3>도파민 모드</h3>
            <ul>
                <li>더 짜릿한 경험을 원하신다면? 가격 변동폭이 더 커지는 '도파민 모드'를 켜보세요!</li>
                <li>평소보다 가격이 더 크게 오르고 내려서 수익 기회가 커집니다. 하지만 손실 위험도 커집니다!</li>
                <li>거래 중에는 모드를 바꿀 수 없으니 신중하게 선택하세요</li>
                <li>화면에 빨간색 테두리가 생기면 도파민 모드가 켜진 상태입니다</li>
            </ul>
            
        </div>

        <div class="guide-section">
            <h3>청산 시스템 이해하기</h3>
            <p>청산은 포지션의 수익이 -100%가 됐음을 뜻합니다.</p>
            <ul>
                <li>레버리지가 높을수록 더 쉽게 청산됩니다</li>
                <li>예를 들어, x10 레버리지를 걸면 가격이 약 10% 정도만 움직여도 청산됩니다</li>
                <li>x100 레버리지는 약 1% 정도의 가격 변동만으로도 청산될 수 있습니다</li>
                <li>청산되면 투자금의 95%를 잃게 되니 주의하세요!</li>
                <li>거래를 시작하면 청산가(얼마에 청산되는지)가 표시됩니다</li>
            </ul>
            <div class="important-note">
                <p>💡 청산 계산법: 100 ÷ 레버리지 = 청산까지 필요한 가격 변동 비율</p>
                <p>예: x20 레버리지 → 100 ÷ 20 = 5% 가격 변동 시 청산</p>
            </div>
        </div>

        <div class="guide-section">
            <h3>주의사항</h3>
            <ul>
                <li>레버리지가 높을수록 더 큰 수익을 낼 수 있지만, 손실도 커집니다</li>
                <li>청산 가격에 도달하면 자동으로 거래가 종료되고 투자금의 대부분을 잃습니다</li>
                <li>한 번에 하나의 거래만 할 수 있습니다</li>
                <li>게임 중에 페이지를 나가면 기록이 사라집니다!</li>
                <li>초보자는 x1~x5 레버리지와 도파민 모드 OFF 상태로 시작하는 것을 권장합니다</li>
            </ul>
        </div>
        
        <div style="text-align: center;">
            <a href="/game/play" class="back-btn">게임 시작하기</a>
        </div>
    </div>
    
    <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html> 