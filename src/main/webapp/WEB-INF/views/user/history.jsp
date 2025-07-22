<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게임 기록</title>
<c:import url="/WEB-INF/views/include/head.jsp" />
<!-- <link rel="stylesheet" href="/resources/css/dark-theme.css"> -->
<style>
    body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        background-color: #f0f0f0;
    }
    .main-content {
        flex: 1;
        padding-bottom: 3rem;
    }
    .score-card {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 15px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        margin-bottom: 2rem;
    }
    .score-table {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 10px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }
    .score-table th {
        background-color: #f5f5f5;
        border-bottom: 2px solid #d0d0d0;
        color: #333;
    }
    .score-table td {
        vertical-align: middle;
        color: #333;
        border-bottom: 1px solid #e6e6e6;
    }
    .high-score {
        font-size: 1.5rem;
        font-weight: bold;
        color: #40c9a2;
    }
    .text-center {
        color: #333;
    }
    .table {
        margin-bottom: 0;
        background-color: #ffffff;
    }
    .table-hover tbody tr:hover {
        background-color: #f5f5f5;
    }
    .table > :not(caption) > * > * {
        background-color: #ffffff;
        color: #333;
    }
    .table > tbody > tr > td {
        border-color: #eee;
    }
    .btn-primary {
        background-color: #40c9a2;
        border-color: #40c9a2;
    }
    .btn-primary:hover {
        background-color: #34a88b;
        border-color: #34a88b;
    }
    .btn-outline-secondary {
        color: #6c757d;
        border-color: #6c757d;
    }
    .btn-outline-secondary:hover {
        background-color: #6c757d;
        border-color: #6c757d;
        color: #ffffff;
    }
    .container.mt-5.main-content {
        background-color: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 20px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        padding: 2rem;
    }
</style>
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container mt-5 main-content">
    <h2 class="text-center mb-4">🎮 내 게임 기록</h2>

    <div class="card score-card">
        <div class="card-body text-center">
            <h4 class="card-title">최고 기록: <span class="high-score"><fmt:formatNumber value="${highScore}" pattern="#,###" />원</span></h4>
            <p class="card-text">총 게임 횟수: ${totalGames}회</p>
        </div>
    </div>

    <div class="card score-table">
        <div class="card-body">
            <h3 class="text-center mb-4">📊 게임 기록 목록</h3>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">순위</th>
                            <th class="text-center">점수</th>
                            <th class="text-center">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="score" items="${scoreList}" varStatus="status">
                            <tr>
                                <td class="text-center">${status.index + 1}</td>
                                <td class="text-center"><fmt:formatNumber value="${score.siScore}" pattern="#,###" />원</td>
                                <td class="text-center">${score.credat}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="/game/play" class="btn btn-primary me-2">게임하기</a>
        <a href="/" class="btn btn-outline-secondary">메인메뉴</a>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html> 