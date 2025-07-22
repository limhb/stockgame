<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${empty sessionScope.user}">
    <script>
        alert("로그인이 필요한 서비스입니다.");
        location.href = "/user/login";
    </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가상 투자 게임 </title>

<c:import url="/WEB-INF/views/include/head.jsp" />
<style>
body {
    background-color: #f0f0f0;
    color: #333;
}

.container {
    background: linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%);
    border-radius: 16px;
    padding: 1.5rem;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
    border: 1px solid #e0e0e0;
    margin-top: 2rem;
    margin-bottom: 2rem;
    transition: all 0.5s ease;
}

h2, h4, h5 {
    color: #333;
}

.form-control {
    background-color: #fff;
    border: 1px solid #ced4da;
    color: #333;
}

.form-control:focus {
    background-color: #fff;
    border-color: #4da6ff;
    color: #333;
    box-shadow: 0 0 0 0.2rem rgba(77, 166, 255, 0.25);
}

.form-select {
    background-color: #fff;
    border: 1px solid #ced4da;
    color: #333;
}

.form-select:focus {
    background-color: #fff;
    border-color: #4da6ff;
    color: #333;
    box-shadow: 0 0 0 0.2rem rgba(77, 166, 255, 0.25);
}

.btn {
    margin: 0 0.25rem;
}

.btn-sm {
    padding: 0.25rem 0.75rem;
}

/* 도파민 모드 애니메이션 */
@keyframes dopaminePulse {
    0% {
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        border-color: rgba(255, 50, 50, 0.3);
    }
    50% {
        box-shadow: 
            0 0 30px rgba(255, 0, 0, 0.6),
            0 0 80px rgba(255, 0, 0, 0.4);
        border-color: rgba(255, 100, 100, 0.8);
    }
    100% {
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        border-color: rgba(255, 50, 50, 0.3);
    }
}

/* 도파민 모드 활성화 시 컨테이너 스타일 */
.dopamine-active {
    animation: dopaminePulse 3s infinite;
    border-width: 2px;
    border-color: rgba(255, 50, 50, 0.3);
}
</style>
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container mt-5" id="gameContainer">
    <h2 class="text-center mb-4">가상 투자 게임</h2>
    <input type="hidden" id="userNum" value="${sessionScope.user.uiNum}">
    
    <!-- 도파민 모드 버튼 부분 -->
    <div class="row justify-content-center mb-4">
        <div class="col-12 text-center">
            <button id="dopamineBtn" class="btn btn-warning me-2">
                도파민 모드 OFF
            </button>
            <span id="dopamineStatus" class="badge bg-secondary">일반 모드</span>
            <div id="dopamineWarning" class="mt-2" style="display: none;">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-triangle"></i>
                    <strong>⚠️ 도파민 모드 활성화됨!</strong><br>
                    가격 변동성이 크게 증가하여 큰 폭의 수익과 손실이 발생할 수 있습니다.<br>
                    청산 위험이 매우 높아지니 신중한 투자가 필요합니다.
                </div>
            </div>
        </div>
    </div>

    <!-- 메인 정보 카드 두 개 행 -->
    <div class="row">
        <!-- 왼쪽: 코인 및 포지션 정보 -->
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h5>선택된 코인: <span id="selectedCoin">XRP</span></h5>
                            <h5>현재 가격: <span id="price">-</span> 원</h5>
                            <div class="position-info mt-3">
                                <h5>포지션 정보:</h5>
                                <div class="ms-3">
                                    <h6>상태: <span id="position" class="fw-bold">없음</span></h6>
                                    <h6>레버리지: <span id="leverage">x1</span></h6>
                                    <h6>보유 수량: <span id="amount">0</span></h6>
                                    <h6>평균 단가: <span id="avgPrice">0</span></h6>
                                </div>
                                <h5 class="text-danger" id="liquidationInfo" style="display: none;">
                                    청산가: <span id="liquidationPrice">0</span> 원
                                    <br>
                                    <small class="text-warning">
                                        (현재가 기준 <span id="liquidationDistance">0</span>% 
                                        <span id="liquidationDirection">하락</span> 시 청산)
                                    </small>
                                </h5>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="text-end d-flex flex-column h-100">
                                <div class="mb-4 text-end">
                                    <h5 style="font-size: 1.3em;">⏱️ 남은 시간: <span id="timer" class="text-warning" style="font-size: 1.2em;">05:00</span></h5>
                                </div>
                                <div class="mt-4 text-end">
                                    <h5>💰 현재 잔액: <span id="balance" class="text-primary">1,000,000</span> 원</h5>
                                    <h5>📈 수익률: <span id="profit" class="text-info">0%</span></h5>
                                    <h5>💵 현재 포지션 수익금: <span id="currentProfit" class="text-success">0원</span></h5>
                                    <h5>📊 총 누적 수익금: <span id="totalProfit" class="text-primary">0원</span></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 오른쪽: 포지션 매수/매도 컨트롤 -->
        <div class="col-md-5">
            <div class="card">
                <div class="card-body">
                    <!-- 포지션 컨트롤 -->
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label class="form-label text-dark">코인 선택</label>
                            <select id="coinSelector" class="form-select w-50 mb-2">
                                <option value="XRP">리플(XRP)</option>
                                <option value="BTC">비트코인 (BTC)</option>
                                <option value="ETH">이더리움 (ETH)</option>
                                <option value="SOL">솔라나 (SOL)</option>
                                <option value="DOGE">도지코인 (DOGE)</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label class="form-label text-dark">투자 금액</label>
                            <div class="d-flex align-items-center">
                                <input type="number" id="investInput" class="form-control w-25" placeholder="0">
                                <div class="ms-2 d-flex">
                                    <button onclick="setInvestmentPercent(25)" class="btn btn-outline-primary btn-sm mx-1">25%</button>
                                    <button onclick="setInvestmentPercent(50)" class="btn btn-outline-primary btn-sm mx-1">50%</button>
                                    <button onclick="setInvestmentPercent(75)" class="btn btn-outline-primary btn-sm mx-1">75%</button>
                                    <button onclick="setInvestmentPercent(100)" class="btn btn-outline-primary btn-sm mx-1">100%</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="d-flex flex-wrap justify-content-between">
                                <button onclick="buy('LONG')" class="btn btn-sm btn-success me-1 mb-1">롱 포지션</button>
                                <button onclick="buy('SHORT')" class="btn btn-sm btn-danger me-1 mb-1">숏 포지션</button>
                                <select id="leverageSelector" class="form-select form-select-sm me-1 mb-1" style="width: auto; min-width: 70px;">
                                    <option value="1">x1</option>
                                    <option value="2">x2</option>
                                    <option value="5">x5</option>
                                    <option value="10">x10</option>
                                    <option value="50">x50</option>
                                    <option value="100">x100</option>
                                </select>
                                <button onclick="sell()" class="btn btn-sm btn-warning me-1 mb-1">포지션 정리</button>
                                <button onclick="endGame()" class="btn btn-sm btn-dark me-1 mb-1">게임 종료</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 차트 -->
    <div class="row mt-4">
        <div class="col-md-12">
            <h4><span id="coinDisplayName">XRP</span> 실시간 가격</h4>
            <canvas id="coinChart" style="max-height:300px;"></canvas>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
let gameState;
let time, timerInterval, priceInterval, currentPrice, selectedCoin, isGameStarted;
let labels, prices, isDopamineMode, liquidationPrice;
let coinChart;

(function initializeGame() {
    gameState = {
        _balance: 1000000,
        _position: null,
        _buyPrice: 0,
        _amount: 0,
        _leverage: 1,
        _positionAmount: 0,
        _totalProfit: 0,
        _currentPositionProfit: 0,
        
        get balance() { return this._balance; },
        get position() { return this._position; },
        get buyPrice() { return this._buyPrice; },
        get amount() { return this._amount; },
        get leverage() { return this._leverage; },
        get positionAmount() { return this._positionAmount; },
        get totalProfit() { return this._totalProfit; },
        get currentPositionProfit() { return this._currentPositionProfit; }
    };

    time = 300;
    timerInterval = null;
    priceInterval = null;
    currentPrice = 0;
    selectedCoin = 'XRP';
    isGameStarted = false;
    labels = [];
    prices = [];
    isDopamineMode = false;
    liquidationPrice = 0;
})();

function convertSeconds(s) {
    let min = String(Math.floor(s / 60)).padStart(2, '0');
    let sec = String(s % 60).padStart(2, '0');
    return min + ':' + sec;
}

$("#timer").html(convertSeconds(time));

function startTimer() {
    if (!isGameStarted) {
        isGameStarted = true;
        timerInterval = setInterval(function() {
            if (time <= 0) {
                $('#timer').text("시간 종료");
                clearInterval(priceInterval);
                clearInterval(timerInterval);
                sendResult();
                return;
            }
            $("#timer").html(convertSeconds(time));
            time--;
        }, 1000);
    }
}

function fetchCoinPrice() {
    const coin = $('#coinSelector').val();
    selectedCoin = coin;
    $('#selectedCoin').text(coin);
    $('#coinDisplayName').text(coin);
    
    $.ajax({
        url: '/game/price',
        method: 'GET',
        data: {
            coin: coin,
            dopamineMode: isDopamineMode
        },
        success: function(response) {
            if (response && response.price) {
                let basePrice = Math.round(parseFloat(response.price));
                
                if (isDopamineMode) {
                    // 도파민 모드: ±30% 변동성
                    const volatility = 0.3; // 30% 고정 변동성
                    const direction = Math.random() > 0.5 ? 1 : -1;
                    const priceChange = basePrice * volatility * direction;
                    currentPrice = Math.round(basePrice + priceChange);
                } else {
                    // 일반 모드: 0.5% ~ 1.2% 변동성
                    const volatility = (Math.random() * 0.7 + 0.5) / 100;
                    const direction = Math.random() > 0.5 ? 1 : -1;
                    const priceChange = basePrice * volatility * direction;
                    currentPrice = Math.round(basePrice + priceChange);
                }
                
                $('#price').text(currentPrice.toLocaleString());

                const now = new Date();
                const timeStr = now.getHours().toString().padStart(2, '0') + ':' +
                              now.getMinutes().toString().padStart(2, '0') + ':' +
                              now.getSeconds().toString().padStart(2, '0');
                
                labels.push(timeStr);
                prices.push(currentPrice);

                if (labels.length > 20) {
                    labels.shift();
                    prices.shift();
                }

                updateCoinChart();
                updateProfit();
                updateLiquidationInfo();
                checkLiquidation();
            }
        }
    });
}

function updateProfit() {
    if (!gameState._position) return;

    const currentAmount = gameState._amount * currentPrice;
    let rawProfit = 0;

    if (gameState._position === 'LONG') {
        rawProfit = (currentPrice - gameState._buyPrice) * gameState._amount * gameState._leverage;
    } else {
        rawProfit = (gameState._buyPrice - currentPrice) * gameState._amount * gameState._leverage;
    }

    // 예상 청산 수수료 계산 (수익이 있을 경우에만 수수료 적용)
    const exitFee = calculateFee(gameState._positionAmount + (rawProfit > 0 ? rawProfit : 0), gameState._leverage);
    const finalProfit = Math.floor(rawProfit - exitFee);

    gameState._currentPositionProfit = finalProfit;

    const profitPercent = ((finalProfit / gameState._positionAmount) * 100).toFixed(2);
    const profitColor = finalProfit >= 0 ? 'text-success' : 'text-danger';
    const profitPrefix = finalProfit >= 0 ? '+' : '';

    $('#currentProfit').removeClass('text-success text-danger').addClass(profitColor)
        .text(profitPrefix + finalProfit.toLocaleString() + '원');
    $('#profit').removeClass('text-success text-danger').addClass(profitColor)
        .text(profitPrefix + profitPercent + '%');
}

function calculateLiquidationPrice(entryPrice, position, leverage) {
    const liquidationPercent = (100 / leverage) * 0.95;
    
    if (position === 'LONG') {
        return entryPrice * (1 - (liquidationPercent / 100));
    } else {
        return entryPrice * (1 + (liquidationPercent / 100));
    }
}

function updateLiquidationInfo() {
    if (!gameState._position || !gameState._buyPrice) return;
    
    const distanceToLiquidation = Math.round(Math.abs(((liquidationPrice - currentPrice) / currentPrice) * 100));
    const direction = gameState._position === 'LONG' ? '하락' : '상승';
    
    $('#liquidationDistance').text(distanceToLiquidation);
    $('#liquidationDirection').text(direction);
}

function checkLiquidation() {
    if (!gameState._position || !gameState._buyPrice) return;
    
    const isLiquidated = gameState._position === 'LONG' 
        ? currentPrice <= liquidationPrice 
        : currentPrice >= liquidationPrice;

    if (isLiquidated) {
        const lossAmount = gameState._positionAmount * -0.95;
        gameState._totalProfit += Math.floor(lossAmount);
        gameState._balance += Math.floor(gameState._positionAmount * 0.05);
        
        gameState._position = null;
        gameState._buyPrice = 0;
        gameState._amount = 0;
        gameState._positionAmount = 0;
        gameState._currentPositionProfit = 0;
        
        $('#position').text("없음");
        $('#avgPrice').text("0");
        $('#amount').text("0");
        $('#balance').text(gameState._balance.toLocaleString());
        $('#currentProfit').text("0원");
        $('#totalProfit').text(gameState._totalProfit.toLocaleString() + '원');
        $('#liquidationInfo').hide();
        
        $('#dopamineBtn').prop('disabled', false)
            .removeClass('btn-secondary')
            .addClass(isDopamineMode ? 'btn-danger' : 'btn-warning');
        
        alert("⚠️ 청산되었습니다! 손실: " + Math.floor(lossAmount).toLocaleString() + "원");
    }
}

function saveGameScore(score, callback) {
    $.ajax({
        url: '/game/save-score',
        method: 'POST',
        data: {
            score: score
        },
        success: function(response) {
            if (response.status === 'success') {
                console.log('점수 저장 완료:', score);
                if (callback) callback(true);
            } else {
                console.error('점수 저장 실패:', response.message);
                if (callback) callback(false);
            }
        },
        error: function(xhr, status, error) {
            console.error('점수 저장 실패:', error);
            if (callback) callback(false);
        }
    });
}

function setInvestmentPercent(percent) {
    let investmentAmount = Math.floor(gameState._balance * (percent / 100));
    $('#investInput').val(investmentAmount);
}

function calculateFee(amount, leverage) {
    // 기본 수수료율 0.05%
    let feeRate = 0.0005;
    
    // 도파민 모드일 경우 수수료 2배 증가
    if (isDopamineMode) {
        feeRate *= 10.0;
    }
    
    // 레버리지에 따른 수수료 증가
    feeRate *= leverage;
    
    // 최종 수수료 계산
    return Math.floor(amount * feeRate);
}

function buy(pos) {
    if (gameState._position) {
        alert("이미 포지션이 있습니다. 먼저 정리하세요.");
        return;
    }

    let investAmount = parseInt($('#investInput').val());
    if (isNaN(investAmount) || investAmount <= 0) {
        alert("투자 금액을 입력해주세요.");
        return;
    }

    if (investAmount > gameState._balance) {
        alert("잔액이 부족합니다!");
        return;
    }

    const leverage = parseInt($('#leverageSelector').val());
    const entryFee = calculateFee(investAmount, leverage);
    // 실제 포지션에 사용되는 금액 (투자금액 - 수수료)
    const actualPositionAmount = investAmount - entryFee;

    gameState._position = pos;
    gameState._leverage = leverage;
    gameState._buyPrice = currentPrice;
    gameState._amount = parseFloat((actualPositionAmount / currentPrice).toFixed(8));
    gameState._positionAmount = actualPositionAmount;
    gameState._balance -= investAmount;

    liquidationPrice = Math.floor(calculateLiquidationPrice(gameState._buyPrice, pos, gameState._leverage));
    $('#liquidationInfo').show();
    $('#liquidationPrice').text(liquidationPrice.toLocaleString());
    updateLiquidationInfo();

    const positionColor = pos === 'LONG' ? 'text-success' : 'text-danger';
    $('#position').removeClass('text-success text-danger').addClass(positionColor).text(pos);
    
    $('#leverage').text('x' + gameState._leverage);
    $('#avgPrice').text(gameState._buyPrice.toLocaleString());
    $('#amount').text(gameState._amount.toFixed(8));
    $('#balance').text(gameState._balance.toLocaleString());
    
    $('#dopamineBtn').prop('disabled', true).addClass('btn-secondary').removeClass('btn-warning btn-danger');
    
    alert("포지션 진입했습니다.\n" +
          "투자 금액: " + investAmount.toLocaleString() + "원\n" +
          "수수료: " + entryFee.toLocaleString() + "원\n" +
          "실제 포지션 금액: " + actualPositionAmount.toLocaleString() + "원");
    startTimer();
}

function sell() {
    if (!gameState._position) {
        alert("정리할 포지션이 없습니다.");
        return;
    }
    
    const rawProfit = Math.floor(gameState._currentPositionProfit);
    const exitFee = calculateFee(gameState._positionAmount + (rawProfit > 0 ? rawProfit : 0), gameState._leverage);
    const finalProfit = rawProfit;  
    
    gameState._totalProfit += finalProfit;
    gameState._balance = Math.floor(gameState._balance + gameState._positionAmount + finalProfit);
    
    alert("포지션이 종료되었습니다.\n" + 
          "총 수익금: " + (rawProfit + exitFee).toLocaleString() + "원\n" +
          "청산 수수료: " + exitFee.toLocaleString() + "원\n" +
          "최종 수익: " + finalProfit.toLocaleString() + "원");
    
    gameState._position = null;
    gameState._buyPrice = 0;
    gameState._amount = 0;
    gameState._positionAmount = 0;
    gameState._currentPositionProfit = 0;
    
    $('#position').text("없음");
    $('#avgPrice').text("0");
    $('#amount').text("0");
    $('#balance').text(gameState._balance.toLocaleString());
    $('#currentProfit').text("0원");
    $('#totalProfit').text(gameState._totalProfit.toLocaleString() + '원');
    $('#liquidationInfo').hide();
    
    $('#dopamineBtn').prop('disabled', false)
        .removeClass('btn-secondary')
        .addClass(isDopamineMode ? 'btn-danger' : 'btn-warning');
}

function endGame() {
    if (confirm("게임을 종료하시겠습니까?")) {
        clearInterval(priceInterval);
        clearInterval(timerInterval);
        
        saveGameScore(gameState._balance, function(success) {
            if (success) {
                alert("게임이 종료되었습니다.");
                location.href = '/game/result';
            } else {
                alert("점수 저장 중 오류가 발생했습니다.");
                location.href = '/game/result';
            }
        });
    }
}

function sendResult() {
    endGame();
}

function updateCoinChart() {
    if (!coinChart) return;
    
    coinChart.data.labels = labels;
    coinChart.data.datasets[0].data = prices;
    coinChart.data.datasets[0].label = selectedCoin + ' 현재가 (KRW)';
    
    const minPrice = Math.min(...prices);
    const maxPrice = Math.max(...prices);
    const margin = (maxPrice - minPrice) * 0.1;
    
    coinChart.options.scales.y.min = Math.floor(minPrice - margin);
    coinChart.options.scales.y.max = Math.ceil(maxPrice + margin);
    
    coinChart.update('none');
}

$(document).ready(function() {
    let ctx = document.getElementById('coinChart').getContext('2d');
    coinChart = new Chart(ctx, {
        type: 'line',
        data: { 
            labels: [], 
            datasets: [{ 
                label: '현재가 (KRW)', 
                data: [], 
                borderColor: 'rgb(54, 162, 235)', 
                backgroundColor: 'rgba(54, 162, 235, 0.2)', 
                borderWidth: 2, 
                tension: 0.3,
                pointRadius: 0
            }] 
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            animation: {
                duration: 0
            },
            scales: {
                y: {
                    beginAtZero: false,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.1)'
                    },
                    ticks: {
                        color: '#333',
                        callback: function(value) {
                            return value.toLocaleString() + '원';
                        }
                    }
                },
                x: {
                    grid: {
                        color: 'rgba(0, 0, 0, 0.1)'
                    },
                    ticks: {
                        color: '#333',
                        maxRotation: 0,
                        autoSkip: true,
                        maxTicksLimit: 10
                    }
                }
            },
            plugins: {
                legend: {
                    labels: {
                        color: '#333'
                    }
                },
                tooltip: {
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function(context) {
                            return context.dataset.label + ': ' + 
                                   context.parsed.y.toLocaleString() + '원';
                        }
                    }
                }
            },
            interaction: {
                mode: 'nearest',
                axis: 'x',
                intersect: false
            }
        }
    });

    fetchCoinPrice();
    priceInterval = setInterval(fetchCoinPrice, 1500);

    $('#coinSelector').change(function() {
        if (gameState._position) {
            alert("포지션을 먼저 정리해주세요.");
            $(this).val(selectedCoin);
            return;
        }
        labels = [];
        prices = [];
        fetchCoinPrice();
    });

    $('#dopamineBtn').click(function() {
        if (gameState._position) {
            alert('포지션을 정리한 후에 도파민 모드를 변경할 수 있습니다.');
            return;
        }
        
        isDopamineMode = !isDopamineMode;
        if (isDopamineMode) {
            $(this).text('도파민 모드 ON').removeClass('btn-warning').addClass('btn-danger');
            $('#dopamineStatus').text('도파민 모드').removeClass('bg-secondary').addClass('bg-danger');
            $('#gameContainer').addClass('dopamine-active');
            $('#dopamineWarning').slideDown();
        } else {
            $(this).text('도파민 모드 OFF').removeClass('btn-danger').addClass('btn-warning');
            $('#dopamineStatus').text('일반 모드').removeClass('bg-danger').addClass('bg-secondary');
            $('#gameContainer').removeClass('dopamine-active');
            $('#dopamineWarning').slideUp();
        }
    });
});
</script>

<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>