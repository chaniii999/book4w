<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookForW 도서 상세페이지 </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
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
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .search-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .search-bar input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .book-detail {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .book-cover {
            width: 200px;
            height: 300px;
            background-color: #ddd;
        }
        .book-info {
            flex-grow: 1;
            margin-left: 20px;
        }
        .book-info h2 {
            font-size: 24px;
            margin: 0;
        }
        .book-info p {
            margin: 5px 0;
            font-size: 16px;
        }
        .rating {
            margin: 5px 0;
            font-size: 16px;
            color: #888;
        }
        .stars {
            color: #FFD700;
            font-size: 18px;
        }
        .reviews {
            margin-top: 20px;
        }
        .review-item {
            margin-bottom: 10px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .review-item p {
            margin: 5px 0;
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
        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            width: 150px;
            margin-left: auto;
            margin-right: auto;
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

    <div class="book-detail">
        <div class="book-cover"></div>
        <div class="book-info">
            <h2>해리포터와 비밀의 방</h2>
            <p>조앤 롤링</p>
            <p>녹림출판사</p>
            <p>출판년도: 1999</p>
            <div class="rating">
                평점: <span class="stars">★★★★☆</span> (17)
            </div>
        </div>
    </div>

    <div class="reviews">
        <div class="review-item">
            <p><strong>식혜먹기</strong> 평점: ★★★★★</p>
            <p>아주 요리를 잘하는 집입니다. 서비스가 좋아요.</p>
        </div>
        <div class="review-item">
            <p><strong>에드워드리</strong> 평점: ★★★★☆</p>
            <p>물고기.</p>
        </div>
        <div class="review-item">
            <p><strong>안성재</strong> 평점: ★★★★☆</p>
            <p>이븐하게 읽었어요.</p>
        </div>
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

    <a href="#" class="back-button">목록으로 돌아가기</a>
</div>
</body>
</html>