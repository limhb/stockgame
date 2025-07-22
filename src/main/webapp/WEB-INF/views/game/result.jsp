<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 랭킹</title>
<c:import url="/WEB-INF/views/include/head.jsp" />
<link rel="stylesheet" href="/resources/css/dark-theme.css">
<style>
    body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .main-content {
        flex: 1;
        padding-bottom: 3rem;
    }
    .score-card {
        background: linear-gradient(135deg, var(--dark-card) 0%, var(--dark-secondary) 100%);
        border: none;
        border-radius: 15px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    }
    .score-table {
        background: var(--dark-card);
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    }
    .score-table th {
        background-color: var(--dark-secondary);
        border-bottom: 2px solid var(--dark-border);
        color: var(--dark-text);
    }
    .score-table td {
        vertical-align: middle;
        color: var(--dark-text);
    }
    .text-center {
        color: var(--dark-text);
    }
    .rank-badge {
        background-color: var(--dark-accent);
        color: white;
        padding: 5px 10px;
        border-radius: 15px;
        font-weight: bold;
    }
    .table {
        margin-bottom: 0;
    }
    .table-hover tbody tr:hover {
        background-color: var(--dark-secondary);
    }
</style>
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container mt-5 main-content">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card score-card">
                <div class="card-body">
                    <h3 class="text-center mb-4">🏆 전체 랭킹</h3>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">순위</th>
                                    <th class="text-center">닉네임</th>
                                    <th class="text-center">점수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="rank" items="${rankList}" varStatus="status">
                                    <tr>
                                        <td class="text-center">
                                            <span class="rank-badge">${status.index + 1}위</span>
                                        </td>
                                        <td class="text-center">${rank.uiNickName}</td>
                                        <td class="text-center"><fmt:formatNumber value="${rank.siScore}" pattern="#,###" />원</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
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
