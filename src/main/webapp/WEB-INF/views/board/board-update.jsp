<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
    }
    .board-title {
        font-size: 2rem;
        font-weight: bold;
        color: #333;
        margin: 0;
    }
    .form-group {
        margin-bottom: 1.5rem;
    }
    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        color: #333;
    }
    .form-control {
        width: 100%;
        padding: 0.5rem;
        background-color: #ffffff;
        border: 1px solid #ccc;
        border-radius: 5px;
        color: #333;
    }
    .form-control:focus {
        outline: none;
        border-color: #40c9a2;
    }
    .btn-group {
        display: flex;
        justify-content: flex-end;
        gap: 1rem;
        margin-top: 2rem;
    }
    .btn {
        padding: 0.5rem 1rem;
        border-radius: 5px;
        text-decoration: none;
        color: white;
        border: none;
        cursor: pointer;
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
</style>
</head>
<body>
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <main class="main-content">
        <div class="board-container">
            <div class="board-card">
                <div class="board-header">
                    <h1 class="board-title">게시글 수정</h1>
                </div>
                <form action="/board/update" method="post">
                    <input type="hidden" name="biNum" value="${board.biNum}">
                    <input type="hidden" name="uiNum" value="${board.uiNum}">
                    <div class="form-group">
                        <label for="biTitle">제목</label>
                        <input type="text" id="biTitle" name="biTitle" class="form-control" value="${board.biTitle}" required>
                    </div>
                    <div class="form-group">
                        <label for="biContent">내용</label>
                        <textarea id="biContent" name="biContent" class="form-control" rows="10" required>${board.biContent}</textarea>
                    </div>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">수정</button>
                        <a href="/board/view/${board.biNum}" class="btn btn-secondary">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>