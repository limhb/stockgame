<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
    .container {
        padding: 2rem;
        max-width: 900px;
    }
    .board-card {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        margin: 2rem auto;
        padding: 2rem;
    }
    .card-body {
        padding: 0;
    }
    .form-group {
        margin-bottom: 1.5rem;
    }
    .form-label {
        font-weight: 500;
        margin-bottom: 0.5rem;
        display: block;
    }
    .form-control {
        background-color: #ffffff;
        border-color: #ccc;
        color: #333;
        padding: 0.75rem;
        border-radius: 8px;
    }
    .form-control:focus {
        background-color: #ffffff;
        border-color: #40c9a2;
        color: #333;
        box-shadow: 0 0 0 0.2rem rgba(64, 201, 162, 0.25);
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
</style>
</head>
<body>
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <main class="main-content">
        <div class="container">
            <div class="board-card">
                <div class="card-body">
                    <h2 class="text-center mb-4">게시글 작성</h2>
                    <form action="/board/insert" method="post">
                        <div class="form-group">
                            <label for="biTitle" class="form-label">제목</label>
                            <input type="text" class="form-control" id="biTitle" name="biTitle" required>
                        </div>
                        <div class="form-group">
                            <label for="biContent" class="form-label">내용</label>
                            <textarea class="form-control" id="biContent" name="biContent" rows="10" required></textarea>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <a href="/board/list" class="btn btn-outline-secondary">목록</a>
                            <button type="submit" class="btn btn-primary">작성</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
