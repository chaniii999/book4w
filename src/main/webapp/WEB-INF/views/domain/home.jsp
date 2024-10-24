<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookForW 추천 도서</title>
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
        /* 추가된 스타일 */
        header a {
            text-decoration: none;
            background-color: #6f6d62a5;
            color: black;
            padding: 10px 15px;
            border-radius: 5px;
            margin-right: 10px;
        }
        header a:hover {
            background-color: #b1b0abc7;
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
        <h2>추천도서</h2>

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

</div>
</body>
</html>