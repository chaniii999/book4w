<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.name} - 상세 정보</title>
    <link rel="stylesheet" href="/css/style.css"> <!-- 스타일은 필요에 따라 추가 -->
</head>
<body>
<header>
    <h1>책 상세 정보</h1>
</header>

<div class="book-detail-container">
    <!-- 책 표지 -->
    <div class="book-cover">
        <img src="${book.coverImage}" alt="${book.name}의 표지" />
    </div>

    <!-- 책 기본 정보 -->
    <div class="book-info">
        <h2>${book.name}</h2>
        <p><strong>작가:</strong> ${book.writer}</p>
        <p><strong>출판사:</strong> ${book.pub}</p>
        <p><strong>출판년도:</strong> ${book.year}</p>
    </div>

    <!-- 책 평점, 좋아요 및 리뷰 정보 -->
    <div class="book-meta">
        <p><strong>평점:</strong> ${book.rating} / 5.0</p>
        <p><strong>좋아요 수:</strong> ${book.likeCount}</p>
        <p><strong>리뷰 수:</strong> ${book.reviewCount}</p>
    </div>
</div>

<footer>
    <p>&copy; 2024 Book4W. All rights reserved.</p>
</footer>
</body>
</html>