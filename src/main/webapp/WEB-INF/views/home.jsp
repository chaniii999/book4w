<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <!-- fmt 태그 추가 -->

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>추천 도서 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        h2 {
            color: #007bff;
        }
        .slider {
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: center;
        }
        .slider-wrapper {
            display: flex;
            transition: transform 0.75s ease-in-out; /* Changed transition duration */
            align-items: center;
        }
        .card {
            max-width: 250px;
            margin: 0 10px;
            transition: transform 0.2s;
            cursor: pointer;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-img {
            height: 300px;
            width: 200px;
            object-fit: cover;
            display: block;
            margin: auto;
        }
        .control-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
            cursor: pointer;
            z-index: 1;
        }
        .prev-button {
            left: 10px;
        }
        .next-button {
            right: 10px;
        }
        .section {
            display: none;
            opacity: 0;
            transform: translateX(100%);
            transition: opacity 0.75s ease-in-out, transform 0.75s ease-in-out; /* Changed transition duration */
        }
        .active-section {
            display: block;
            opacity: 1;
            transform: translateX(0);
        }
    </style>
</head>
<body>
<div class="container my-5 text-center">
    <h1 class="text-center">추천 도서 목록</h1>
    <!-- 평점 순 추천 도서 슬라이드 -->
    <div class="section active-section" id="section1">
        <h2 class="mt-5">평점이 높은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="ratingSlider">
                <c:forEach var="book" items="${recommendedByRating}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <div class="text-center">
                                <img src="/images/Cover1.jpg" class="card-img-top card-img" alt="Book 1 이미지">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
<%--                                <p class="card-text">작가: ${book.bookWriter}</p>--%>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">평점: <fmt:formatNumber value="${book.bookRating}" type="number" minFractionDigits="1" maxFractionDigits="1"/></p>
                                <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                                <p class="card-text">좋아요 수: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <button class="control-button prev-button" onclick="switchSection(-1)">◀</button>
            <button class="control-button next-button" onclick="switchSection(1)">▶</button>
        </div>
    </div>
    <!-- 리뷰 수가 많은 도서 슬라이드 -->
    <div class="section" id="section2">
        <h2 class="mt-5">리뷰 수가 많은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="reviewSlider">
                <c:forEach var="book" items="${recommendedByReviewCount}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <div class="text-center">
                                <img src="/images/Cover2.jpg" class="card-img-top card-img" alt="Book 2 이미지">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
<%--                                <p class="card-text">작가: ${book.bookWriter}</p>--%>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">평점: <fmt:formatNumber value="${book.bookRating}" type="number" minFractionDigits="1" maxFractionDigits="1"/></p>
                                <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                                <p class="card-text">좋아요 수: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <button class="control-button prev-button" onclick="switchSection(-1)">◀</button>
            <button class="control-button next-button" onclick="switchSection(1)">▶</button>
        </div>
    </div>
    <!-- 좋아요 수가 많은 도서 슬라이드 -->
    <div class="section" id="section3">
        <h2 class="mt-5">좋아요 수가 많은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="likeSlider">
                <c:forEach var="book" items="${recommendedByLikeCount}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <div class="text-center">
                                <img src="/images/Cover3.jpg" class="card-img-top card-img" alt="Book 3 이미지">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
<%--                                <p class="card-text">작가: ${book.bookWriter}</p>--%>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">평점: <fmt:formatNumber value="${book.bookRating}" type="number" minFractionDigits="1" maxFractionDigits="1"/></p>
                                <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                                <p class="card-text">좋아요 수: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <button class="control-button prev-button" onclick="switchSection(-1)">◀</button>
            <button class="control-button next-button" onclick="switchSection(1)">▶</button>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let currentSection = 0;
    const sections = document.querySelectorAll('.section');

    function switchSection(direction) {
        const current = sections[currentSection];
        currentSection = (currentSection + direction + sections.length) % sections.length;
        const next = sections[currentSection];

        current.classList.remove('active-section');
        next.classList.remove('active-section');

        current.style.transform = direction > 0 ? 'translateX(-100%)' : 'translateX(100%)';
        next.style.display = 'block';
        next.style.transform = direction > 0 ? 'translateX(100%)' : 'translateX(-100%)';

        setTimeout(() => {
            current.style.display = 'none';
            next.style.transform = 'translateX(0)';
            next.classList.add('active-section');
        }, 750); // Adjusted to 750ms for slower, smoother animation
    }

    setInterval(() => {
        switchSection(1);
    }, 10000); // Automatically switch sections every 5 seconds
</script>
</body>
</html>
