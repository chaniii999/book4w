<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>추천 도서 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4; /* 배경색 */
        }
        h1 {
            color: #333; /* 메인 제목 색상 */
        }
        h2 {
            color: #007bff; /* 섹션 제목 색상 */
        }
        .card {
            transition: transform 0.2s; /* 카드 확대 효과 */
            cursor: pointer; /* 클릭 가능 커서 */
        }
        .card:hover {
            transform: scale(1.05); /* 마우스 오버 시 카드 확대 */
        }
    </style>
</head>
<body>

<div class="container my-5">
    <h1 class="text-center">추천 도서 목록</h1>

    <!-- 평점 순 추천 도서 -->
    <h2 class="mt-5">평점이 높은 도서</h2>
    <div class="row">
        <c:forEach var="book" items="${recommendedByRating}">
            <div class="col-md-4">
                <a href="board/detail/${book.bookUuid}" class="text-decoration-none"> <!-- 카드 클릭 시 링크 추가 -->
                    <div class="card mb-4 shadow-sm">
                     <!-- 그림자 효과 추가 -->
                     <img src="/images/Cover1.jpg" class="card-img-top" alt="Book 1 이미지">


                        <div class="card-body">
                            <h5 class="card-title">${book.bookName}</h5>
                            <p class="card-text">작가: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>

    <!-- 리뷰 수 순 추천 도서 -->
    <h2 class="mt-5">리뷰 수가 많은 도서</h2>
    <div class="row">
        <c:forEach var="book" items="${recommendedByReviewCount}">
            <div class="col-md-4">
                <a href="board/detail/${book.bookUuid}" class="text-decoration-none"> <!-- 카드 클릭 시 링크 추가 -->
                    <div class="card mb-4 shadow-sm">
<%--                    <img src="${book.coverImage}" class="card-img-top" alt="${book.bookName} 표지 이미지">--%>
                    <img src="/images/Cover2.jpg" class="card-img-top" alt="${book.bookName} 표지 이미지">


                        <div class="card-body">
                            <h5 class="card-title">${book.bookName}</h5>
                            <p class="card-text">작가: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>

    <!-- 좋아요 수 순 추천 도서 -->
    <h2 class="mt-5">좋아요 수가 많은 도서</h2>
    <div class="row">
        <c:forEach var="book" items="${recommendedByLikeCount}">
            <div class="col-md-4">
                <a href="board/detail/${book.bookUuid}" class="text-decoration-none"> <!-- 카드 클릭 시 링크 추가 -->
                    <div class="card mb-4 shadow-sm">
                    <img src="/images/Cover3.jpg" class="card-img-top" alt="Book 3 이미지">

                        <div class="card-body">
                            <h5 class="card-title">${book.bookName}</h5>
                            <p class="card-text">작가: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>