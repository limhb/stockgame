<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<meta charset="UTF-8">
<title>${board.biTitle}</title>
<style>
body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    background-color: #f0f0f0;
}

.main-content {
    flex: 1;
    padding: 2rem 0;
}

.board-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

.board-card {
    background: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    margin: 2rem auto;
    padding: 2rem;
}

.board-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid #eee;
}

.board-title {
    font-size: 2rem;
    font-weight: bold;
    color: #333;
    margin: 0;
}

.board-info {
    color: #666;
    font-size: 0.9rem;
    margin-bottom: 1.5rem;
}

.board-content {
    background-color: #f9f9f9;
    padding: 1.5rem;
    border-radius: 10px;
    min-height: 200px;
    line-height: 1.6;
    color: #333;
    margin-bottom: 1.5rem;
    border: 1px solid #e0e0e0;
}

.board-footer {
    display: flex;
    justify-content: space-between;
    gap: 1rem;
    margin-top: 2rem;
    padding-top: 1rem;
    border-top: 1px solid #eee;
}

.btn {
    padding: 0.5rem 1rem;
    border-radius: 5px;
    text-decoration: none;
    color: white;
    border: none;
    cursor: pointer;
    transition: all 0.3s;
    font-size: 0.9rem;
    line-height: 1.5;
    display: inline-block;
    text-align: center;
    min-width: 60px;
}

.btn-primary {
    background-color: #40c9a2;
}

.btn-primary:hover {
    background-color: #34a88b;
}

.btn-secondary {
    background-color: #6c757d;
}

.btn-secondary:hover {
    background-color: #5a6268;
}

.btn-danger {
    background-color: #dc3545;
}

.btn-danger:hover {
    background-color: #c82333;
}

.btn-group {
    display: flex;
    gap: 0.5rem;
    align-items: center;
}

.btn-group a,
.btn-group button {
    border-radius: 5px !important;
}
</style>
</head>
<body>
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <main class="main-content">
        <div class="board-container">
            <div class="board-card">
                <div class="board-header">
                    <h1 class="board-title">${board.biTitle}</h1>
                </div>
                <div class="board-info">
                    ${board.uiName} | ${board.credat} | ${board.cretim}
                </div>
                <div class="board-content">${board.biContent}</div>
                <div class="board-footer">
                    <a href="/board/list" class="btn btn-secondary">목록</a>
                    <div class="btn-group">
                        <c:if test="${sessionScope.user.uiNum == board.uiNum}">
                            <a href="/board/update/${board.biNum}" class="btn btn-primary">수정</a>
                            <form action="/board/delete/${board.biNum}" method="post" style="display: inline;">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
