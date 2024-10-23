<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>추천 도서 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">추천 도서 목록</h1>

    <div class="row mt-4">
        <h2>평점 순 추천 도서</h2>
        <div class="row">
            <c:forEach var="book" items="${recommendedByRating}">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="${book.coverImage}" class="card-img-top" alt="${book.bookName}">
                        <div class="card-body">
                            <h5 class="card-title">${book.bookName}</h5>
                            <p class="card-text">저자: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="row mt-4">
        <h2>리뷰 수 순 추천 도서</h2>
        <div class="row">
            <c:forEach var="book" items="${recommendedByReviewCount}">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="${book.coverImage}" class="card-img-top" alt="${book.bookName}">
                        <div class="card-body">
                            <h5 class="card-title">${book.bookName}</h5>
                            <p class="card-text">저자: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="row mt-4">
        <h2>좋아요 수 순 추천 도서</h2>
        <div class="row">
            <c:forEach var="book" items="${recommendedByLikeCount}">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="${book.coverImage}" class="card-img-top" alt="${book.bookName}">
                        <div class="card-body">
                            <h5 class="card-title">${book.bookName}</h5>
                            <p class="card-text">저자: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.11/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
