<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<c:import url="/WEB-INF/views/include/head.jsp" />
<style>
    :root {
        --dark-bg: #f0f0f0;
        --dark-secondary: #f8f9fa;
        --dark-card: #ffffff;
        --dark-border: #e0e0e0;
        --dark-text: #333333;
        --dark-accent: #40c9a2;
        --dark-accent-hover: #34a88b;
    }
    
    body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        background-color: var(--dark-bg);
    }
    .main-content {
        flex: 1;
        padding: 2rem 0;
    }
    .board-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
        border: 1px solid var(--dark-border);
        background-color: var(--dark-card);
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .board-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1.5rem;
        border-bottom: 2px solid var(--dark-border);
        padding-bottom: 1rem;
    }
    .board-title {
        font-size: 2rem;
        font-weight: bold;
        color: var(--dark-text);
        margin: 0;
    }
    .search-form {
        display: flex;
        justify-content: flex-end;
        gap: 8px;
        margin-bottom: 1.5rem;
    }
    .search-form select,
    .search-form input {
        padding: 8px 12px;
        border-radius: 4px;
        border: 1px solid var(--dark-border);
        background-color: var(--dark-secondary);
        color: var(--dark-text);
    }
    .search-form input {
        width: 250px;
    }
    .search-form button {
        padding: 8px 16px;
        border-radius: 4px;
        border: none;
        background-color: var(--dark-accent);
        color: white;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }
    .search-form button:hover {
        background-color: var(--dark-accent-hover);
    }
    .board-table {
        width: 100%;
        border-collapse: collapse;
        background-color: var(--dark-card);
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 1rem;
    }
    .board-table th {
        background-color: var(--dark-secondary);
        color: var(--dark-text);
        padding: 1rem;
        text-align: center;
        border-bottom: 2px solid var(--dark-border);
    }
    .board-table td {
        padding: 1rem;
        color: var(--dark-text);
        border-bottom: 1px solid var(--dark-border);
    }
    .board-table tr:hover {
        background-color: var(--dark-secondary);
    }
    .board-table .center {
        text-align: center;
    }
    .board-table .title {
        text-align: left;
    }
    .board-table .title a {
        color: var(--dark-text);
        text-decoration: none;
        transition: color 0.2s ease;
    }
    .board-table .title a:hover {
        color: var(--dark-accent);
    }
    .write-btn a {
        display: inline-block;
        padding: 0.7rem 1.5rem;
        background-color: var(--dark-accent);
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: 500;
        transition: all 0.2s ease;
    }
    .write-btn a:hover {
        background-color: var(--dark-accent-hover);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        transform: translateY(-2px);
    }
    /* 페이지네이션 스타일 */
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 5px;
        margin-top: 20px;
    }
    
    .pagination a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 32px;
        height: 32px;
        padding: 0 6px;
        border-radius: 4px;
        background-color: var(--dark-secondary);
        color: var(--dark-text);
        text-decoration: none;
        transition: all 0.2s ease;
    }
    
    .pagination a:hover {
        background-color: var(--dark-accent);
        color: white;
    }
    
    .pagination strong {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 32px;
        height: 32px;
        padding: 0 6px;
        border-radius: 4px;
        background-color: var(--dark-accent);
        color: white;
    }
    
    .pagination .nav-button {
        padding: 0 12px;
    }
</style>
</head>
<body>
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <main class="main-content">
        <div class="board-container">
            <div class="board-header">
                <h1 class="board-title">게시판</h1>
                <div class="write-btn">
                    <a href="/board/insert"><i class="fas fa-pen"></i> 글쓰기</a>
                </div>
            </div>
            
            <form class="search-form">
                <select name="searchType">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
                <button type="button" onclick="getBoards(1)"><i class="fas fa-search"></i> 검색</button>
            </form>

            <table class="board-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody id="tBody"></tbody>
                <tfoot>
                    <tr>
                        <td colspan="4" id="pageDis"></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </main>
    <c:import url="/WEB-INF/views/include/footer.jsp" />

    <script>
    let currentPage = 1;
    const pageSize = 10;

    function getBoards(page) {
        if(!page) page = 1;
        currentPage = page;
        
        const searchType = $('select[name="searchType"]').val();
        const searchKeyword = $('input[name="searchKeyword"]').val();
        
        let params = {
            page: currentPage
        };
        
        if(searchKeyword) {
            params.searchType = searchType;
            params.searchKeyword = searchKeyword;
        }
        
        $.ajax({
            url: '/board/list/data',
            method: 'GET',
            data: params,
            success: function(res) {
                console.log('Response:', res);
                const boards = res.boardList;
                const totalPage = res.totalPage;

                var html = '';
                for(const board of boards) {
                    html += '<tr>';
                    html += '<td class="center">' + board.biNum + '</td>';
                    html += '<td><a href="/board/view/' + board.biNum + '">' + board.biTitle + '</a></td>';
                    html += '<td class="center">' + board.uiName + '</td>';
                    html += '<td class="center">' + board.credat + '</td>';
                    html += '</tr>';
                }
                $('#tBody').html(html);
                
                // 페이지네이션
                var start = Math.floor((page-1)/pageSize)*pageSize+1;
                var end = start+pageSize-1;
                if(end > totalPage) {
                    end = totalPage;
                }
                
                var pageHtml = '<div class="pagination">';
                
                // 이전 페이지 버튼
                if(start > 1) {
                    pageHtml += '<a href="javascript:void(0)" onclick="getBoards(' + (start-1) + ')" class="nav-button">이전</a>';
                }
                
                // 페이지 번호
                for(let i = start; i <= end; i++) {
                    if(i === currentPage) {
                        pageHtml += '<strong>' + i + '</strong>';
                    } else {
                        pageHtml += '<a href="javascript:void(0)" onclick="getBoards(' + i + ')">' + i + '</a>';
                    }
                }
                
                // 다음 페이지 버튼
                if(end < totalPage) {
                    pageHtml += '<a href="javascript:void(0)" onclick="getBoards(' + (end+1) + ')" class="nav-button">다음</a>';
                }
                
                pageHtml += '</div>';
                $('#pageDis').html(pageHtml);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('데이터를 불러오는데 실패했습니다.');
            }
        });
    }

    // 페이지 로드 시 첫 페이지 데이터 로드
    $(document).ready(function() {
        getBoards(1);
    });

    // 검색어 입력 후 엔터 키 처리
    $('input[name="searchKeyword"]').on('keypress', function(e) {
        if(e.which === 13) {
            e.preventDefault();
            getBoards(1);
        }
    });
    </script>
</body>
</html>