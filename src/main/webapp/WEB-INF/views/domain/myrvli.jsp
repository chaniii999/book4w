
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>내 리뷰 목록</title>
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
    .review-header {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .review-list {
      display: flex;
      flex-direction: column;
    }
    .review-item {
      display: flex;
      border-bottom: 1px solid #eee;
      padding: 15px 0;
      align-items: flex-start;
    }
    .book-cover {
      width: 60px;
      height: 80px;
      background-color: #ddd;
      margin-right: 20px;
    }
    .review-content {
      flex-grow: 1;
    }
    .review-content h2 {
      font-size: 18px;
      margin: 0;
    }
    .review-content p {
      margin: 5px 0;
      font-size: 16px;
      color: #555;
    }
    .stars {
      color: #FFD700;
      font-size: 16px;
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

  <div class="review-header">내 리뷰 목록</div>

  <div class="review-list">
    <div class="review-item">
      <div class="book-cover"></div>
      <div class="review-content">
        <h2>해리포터와 비밀의 방</h2>
        <p>조앤 롤링</p>
        <p>식혜먹기 | 평점: <span class="stars">★★★★☆</span></p>
        <p>아주 요리를 잘하는 집입니다. 서비스가 좋아요.</p>
      </div>
    </div>
    <div class="review-item">
      <div class="book-cover"></div>
      <div class="review-content">
        <h2>해리포터와 비밀의 방</h2>
        <p>조앤 롤링</p>
        <p>식혜먹기 | 평점: <span class="stars">★★★★☆</span></p>
        <p>아주 요리를 잘하는 집입니다. 서비스가 좋아요.</p>
      </div>
    </div>
    <div class="review-item">
      <div class="book-cover"></div>
      <div class="review-content">
        <h2>해리포터와 비밀의 방</h2>
        <p>조앤 롤링</p>
        <p>식혜먹기 | 평점: <span class="stars">★★★★☆</span></p>
        <p>아주 요리를 잘하는 집입니다. 서비스가 좋아요.</p>
      </div>
    </div>
    <div class="review-item">
      <div class="book-cover"></div>
      <div class="review-content">
        <h2>해리포터와 비밀의 방</h2>
        <p>조앤 롤링</p>
        <p>식혜먹기 | 평점: <span class="stars">★★★★☆</span></p>
        <p>아주 요리를 잘하는 집입니다. 서비스가 좋아요.</p>
      </div>
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
</div>

</body>
</html>