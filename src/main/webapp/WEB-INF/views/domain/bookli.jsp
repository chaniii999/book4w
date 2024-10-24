<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookForW 도서 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            background-color: #ffffff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            color: #4CAF50;
            font-size: 24px;
        }
        .search-bar {
            width: 100%;
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }
        .search-bar input {
            width: 50%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .book-list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .book-list-header .buttons {
            display: flex;
            gap: 10px; /* 버튼 사이 간격 조정 */
        }
        .book-list-header button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .book-list {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .book-item {
            width: 100%;
            height: 200px;
            background-color: #ddd;
            border-radius: 8px;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<header>
    <h1>BookForW</h1>
    <div>
        <a href="#">내 리뷰 관리</a>
        <a href="#">내 좋아요 목록</a>
        <a href="#">내 프로필</a>
        <button>Log-in</button>
    </div>
</header>

<div class="container">
    <div class="search-bar">
        <input type="text" placeholder="검색">
    </div>

    <div class="book-list-header">
        <h2>도서목록</h2>
        <div class="buttons">
            <button>분류</button>
            <button>평점순</button>
        </div>
    </div>

    <div class="book-list">
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
        <div class="book-item"></div>
    </div>

    <div class="pagination">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">8</a>
        <a href="#">9</a>
    </div>
</div>

</body>
</html>