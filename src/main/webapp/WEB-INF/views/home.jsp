<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="include/searchForm.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>추천 도서 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1 class="mt-4">추천 도서 목록</h1>

    <!-- 평점 순 추천 도서 -->
    <h2 class="mt-5">평점이 높은 도서</h2>
    <div class="row">
        <c:forEach var="book" items="${recommendedByRating}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">${book.bookName}</h5>
<%--                        <p class="card-text">id: ${book.bookUuid}</p>--%>
                        <p class="card-text">작가: ${book.bookWriter}</p>
                        <p class="card-text">출판사: ${book.bookPub}</p>
                        <p class="card-text">평점: ${book.bookRating}</p>
                        <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                        <p class="card-text">좋아요 수: ${book.likeCount}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 리뷰 수 순 추천 도서 -->
    <h2 class="mt-5">리뷰 수가 많은 도서</h2>
    <div class="row">
        <c:forEach var="book" items="${recommendedByReviewCount}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">${book.bookName}</h5>
<%--                        <p class="card-text">id: ${book.bookUuid}</p>--%>
                        <p class="card-text">작가: ${book.bookWriter}</p>
                        <p class="card-text">출판사: ${book.bookPub}</p>
                        <p class="card-text">평점: ${book.bookRating}</p>
                        <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                        <p class="card-text">좋아요 수: ${book.likeCount}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 좋아요 수 순 추천 도서 -->
    <h2 class="mt-5">좋아요 수가 많은 도서</h2>
    <div class="row">
        <c:forEach var="book" items="${recommendedByLikeCount}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">${book.bookName}</h5>
<%--                        <p class="card-text">id: ${book.bookUuid}</p>--%>
                        <p class="card-text">작가: ${book.bookWriter}</p>
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

</body>
</html>
